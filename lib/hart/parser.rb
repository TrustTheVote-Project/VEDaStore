require 'nokogiri'

module Hart
  class Parser
    def self.parse(dest, report, source_id, include_results=false)
      
      source = BackgroundSource.find(source_id)

      Hart::Mapper.map(dest)      
      
      er = DMap::ModelRegister.classes[:election_report].all.values.first
    
      # build the election report
      jurisdiction = report.jurisdiction
      election = Vssc::Election.new
      report.elections << election
    
      report.object_id = "election-report-#{er.name}"
      election.object_id = "election-#{er.name}"
      election.name = er.name
    
      report.issuer = er.locality
      report.sequence = 0
      report.sequence_end = 0
      report.vendor_application_id = "OSET-VSSC-RUBY-HART-MAPPER"
      report.format = er.format == 'Precinct' ? Vssc::ReportFormat.precinct_level : Vssc::ReportFormat.summary_contest
      
      # Hart data is always pre-election
      report.status = Vssc::ReportStatus.pre_election    
    
      report.date = DateTime.iso8601(Date.parse(er.date).iso8601)
      report.state_abbreviation = er.state_abbreviation
    
      DMap::ModelRegister.classes[:district].all.values.each do |d|
        district = Vssc::District.new

        district.local_geo_code = d.id
        district.name = d.attributes[:name]
        source_district = source.districts.where(internal_id: d.id).first
        if source_district.nil?
          raise "District #{d} not found in background data from source #{source}!"
        end
        
        district.object_id = source_district.object_id
        district.national_geo_code = source_district.ocd_id
        district.district_type = source_district.district_type
        
        # In this eleciton report, only the used sub-units should get added, 
        # so don't automatically all of the source-district's reporting units. 
        # Do it according to the Hart election definition
        # source_district.reporting_units.each do |ru|
        #   district.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id: ru.object_id)
        # end
            
        report.gp_units << district
      
      end
      
      # Save the report to the district objects are findable later
      report.save!
      
      
    
      # put all the precincts in with the related precinct-splits
      DMap::ModelRegister.classes[:precinct].all.values.each do |p|
        precinct = Vssc::ReportingUnit.new
        precinct.local_geo_code = p.id
        source_precinct = source.reporting_units.where(:internal_id=>p.id).first
        if source_precinct.nil?
          raise "Precinct #{p} not found in source #{source}"
        end

        precinct.object_id = source_precinct.object_id
        precinct.national_geo_code = source_precinct.ocd_id
        report.gp_units << precinct      
      end
      
      report.save!
      
      DMap::ModelRegister.classes[:precinct_split].all.values.each do |ps|
        precinct_split = Vssc::ReportingUnit.new
        # precinct split has no background source equivalent??
        precinct_split.object_id = "vspub-precinct-split-#{ps.id}"
        precinct = report.gp_units.where(local_geo_code: ps.precinct_id, type: 'Vssc::ReportingUnit').first
        if precinct.nil?
          raise "Precinct #{ps.precint_id} not found in source report"
        end
        
        precinct.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id:  precinct_split.object_id)
        precinct.save!
        report.gp_units << precinct_split
      end
      report.save!
      
      DMap::ModelRegister.classes[:district_precinct_split].all.values.each do |d_ps|
        district = report.gp_units.where(local_geo_code: d_ps.district_id, type: 'Vssc::District').first
        precinct_split = report.gp_units.where(object_id: "vspub-precinct-split-#{d_ps.precinct_split_id}").first
        district.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id:  precinct_split.object_id)
        district.save!
      end
    
      DMap::ModelRegister.classes[:party].all.values.each do |p|
        party = Vssc::Party.new
        party.abbreviation = p.abbreviation
        party.name = p.name
        party.local_party_code = p.party_id
        # this can't be determined from this file alone!!
        #party.object_id = "party-#{p.id}"
      
        report.parties << party
      end
      report.save!
      
      DMap::ModelRegister.classes[:candidate].all.values.each do |c|
        candidate = nil
        
        case c.relations(:contest).last.contest_type.downcase
        when 'c'
          candidate = Vssc::Candidate.new
          candidate.object_id ="candidate-#{c.id}"
          candidate.party = "party-#{c.party_id}"
          candidate.ballot_name = c.name
          candidate.sequence_order = c.order
          election.candidates << candidate
        when 'p'
        when 's'
        else 
          #nothing else
        end

      end
      report.save!
    
      DMap::ModelRegister.classes[:contest].all.values.each do |c|
        contest = nil
        if c.contest_type.downcase == "c"
          contest = Vssc::CandidateChoice.new
          contest.office = "office-#{c.id}"
        
          office = Vssc::Office.new
          office.object_id = "office-#{c.id}"
          office.name = c.office
          report.offices << office
        
        
          contest.number_elected = c.number_elected
          # For each candidate
          contest_gp_units = {}
          c.relations(:candidate).each_with_index do |candidate, i|
            candidate_selection= Vssc::CandidateSelection.new
            candidate_selection.object_id = "candidate-selection-#{candidate.id}"
            candidate_selection.candidate_selection_candidate_refs << Vssc::CandidateSelectionCandidateRef.new(object_id: "candidate-#{candidate.id}")
            
            cc = "#{c.id} - #{candidate.id}"
            contest.ballot_selections << candidate_selection
          end
        elsif c.contest_type.downcase == "p"
          contest = Vssc::BallotMeasure.new
          contest.full_text = c.ballot_measure_title
          c.relations(:candidate).each do |candidate|
            candidate_selection= Vssc::BallotMeasureSelection.new
            candidate_selection.object_id ="ballot-measure-selection-#{candidate.id}"
            candidate_selection.selection = candidate.name
            contest.ballot_selections << candidate_selection
          end
        elsif c.contest_type.downcase == "s"
          contest = Vssc::StraightParty.new
          c.relations(:candidate).each do |candidate|
            candidate_selection = report.parties.where(local_party_code: candidate.party_id).first
            if candidate_selection.nil?
              raise "Party #{candidate.party_id} not found! (#{candidate.inspect})"
            end
            # this is the only place the party "id" is defined (as used by the exported results)
            candidate_selection.object_id = "party-#{candidate.id}"
            candidate_selection.save!
            contest.ballot_selections << candidate_selection
          end
          # Straight Party
        
        else
          # Don't record generic ballot text
          next
        end
      
        # For whatever the contest, look at all the precinct-splits in the contest/precinct-split
        # and detect an exatly-matching district
        district_id = c.relations(:district_contest).last.district_id
        contest.contest_gp_scope = source.districts.where(internal_id: district_id).first.object_id

        contest.object_id = "contest-#{c.id}"
        contest.name = c.office
        contest.sequence_order = c.order
        #:order, :id, :office, :contest_type, :instruction_text, :ballot_measure_title
      
        election.contests << contest
      end
    
      puts report.valid?
      puts report.errors.messages.collect{|k,v|"#{k}: #{v}"}.join("\n")
      
      return report
      
    end
  end
end
