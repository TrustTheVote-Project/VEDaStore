require 'nokogiri'

module Hart
  class Parser
    def self.parse(dest, report, include_results=false)
      
      Hart::Mapper.map(dest)      
      
      
      er = DMap::ModelRegister.classes[:election_report].all.values.first
    
      # build the election report
      jurisdiction = report.jurisdiction
      election = Vssc::Election.new
      report.elections << election
    
      report.object_id = "election-report-#{er.name}"
      election.object_id = "election-#{er.name}"
    
      report.issuer = er.locality
      report.sequence = 0
      report.sequence_end = 0
      report.vendor_application_id = "OSET-VSSC-RUBY-HART-MAPPER"
      report.format = er.format == 'Precinct' ? Vssc::ReportFormat.precinct_level : Vssc::ReportFormat.summary_contest
      report.status = Vssc::ReportStatus.test    
    
      report.date = DateTime.iso8601(Date.parse(er.date).iso8601)
      report.state_abbreviation = er.state_abbreviation
    
      # put in all the districts in with the related precinct-splits
      # Make a hash of districts based on set of sub-gpus
      district_from_gpus = {}
      
      # districts also need extra data to be complete. this should come from *background* data
      district_meta = {}
      jurisdiction.districts.each do |d|
        district_meta[d.internal_id] = d
      end
      # district_rows = CSV.read('./doc/hart/G12/MODIFIED_DISTRICT.csv', :headers=>true)
      # district_rows.each do |row|
      #  district_meta[row['ID']] = row
      # end
      
      
      DMap::ModelRegister.classes[:district].all.values.each do |d|
        district = Vssc::District.new
        district.object_id = "district-#{d.attributes[:id]}"
        district.name = d.attributes[:name]
        bd = district_meta[d.id]
        if bd.nil?
          raise "District #{d} not found!"
        end
        district.district_type = bd.district_type
        bd.reporting_units.each do |ru|
          district.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id: ru.object_id)
        end
            
        report.gp_units << district
      
      end
    
      # put all the precincts in with the related precinct-splits
      DMap::ModelRegister.classes[:precinct].all.values.each do |p|
        precinct = Vssc::ReportingUnit.new
        bp = jurisdiction.reporting_units.where(:internal_id=>p.id).first
        precinct.object_id = bp.object_id
      
        report.gp_units << precinct      
      end
    
      DMap::ModelRegister.classes[:party].all.values.each do |p|
        party = Vssc::Party.new
        party.abbreviation = p.abbreviation
        party.name = p.name
        party.object_id = "party-#{p.id}"
      
        report.parties << party
      end
    
      DMap::ModelRegister.classes[:candidate].all.values.each do |c|
        candidate = Vssc::Candidate.new
        candidate.object_id ="candidate-#{c.id}"
        candidate.party = "party-#{c.party_id}"
        candidate.ballot_name = c.name
        candidate.sequence_order = c.order
        election.candidates << candidate
      end
    
      # CUSTOM  pullng results from CSV
      # results = CSV.read("./doc/hart/20121106results-mod.csv", :headers=>true)
      # contest_candidates = {}
      # results.each do |row|
      #   cc = "#{row['Contest_Id']} - #{row['candidate_id']}"
      #   contest_candidates[cc] ||= []
      #   contest_candidates[cc] << row
      # end
    
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
            candidate_selection.object_id ="candidate-selection-#{candidate.id}"
            candidate_selection.candidate_selection_candidate_refs << Vssc::CandidateSelectionCandidateRef.new(object_id: "candidate-#{candidate.id}")
            
            cc = "#{c.id} - #{candidate.id}"
            if include_results
              contest_candidates[cc].each do |row|
                vc_a = Vssc::VoteCounts.new
                vc_e = Vssc::VoteCounts.new
                vc = Vssc::VoteCounts.new
                # "Precinct_name":"101" 
                # "Reporting_flag":"1" 
                # "total_ballots":"2061"
                # "total_votes":"1110"
                # "total_under_votes":"757"
                # "total_over_votes":"0"
                # "absentee_ballots":"48"
                # "absentee_votes":"28"
                # "absentee_under_votes":"18"
                # "absentee_over_votes":"0"
                # "early_ballots":"1133"
                # "early_votes":"628"
                # "early_under_votes":"406"
                # "early_over_votes":"0"
                # "election_ballots":"880"
                # "election_votes":"454"
                # "election_under_votes":"333"
                # "election_over_votes":"0"
                vc_e.gp_unit = vc.gp_unit = vc_a.gp_unit = "precinct-split-#{row["Pct_Id"]}"
                vc_a.object_id = "votecount-#{cc}-absentee"
                vc_a.ballot_type = Vssc::BallotType.absentee
                vc_a.count = row["absentee_votes"]
                vc_e.object_id = "votecount-#{cc}-early"
                vc_e.ballot_type = Vssc::BallotType.early
                vc_e.count = row["early_votes"]
                vc.object_id = "votecount-#{cc}-election-day"
                vc.ballot_type = Vssc::BallotType.election_day
                vc.count = row["election_votes"]
                candidate_selection.vote_counts << vc
                candidate_selection.vote_counts << vc_a
                candidate_selection.vote_counts << vc_e
              
                # for the first candidate in the loop put in the totals
                if i == 0
                  total_count = Vssc::TotalCounts.new
                  total_count.gp_unit = "precinct-split-#{row["Pct_Id"]}"
                  total_count.object_id = "total-counts-#{total_count.gp_unit}-#{c.id}"
                  total_count.ballots_cast = row["total_ballots"]
                  total_count.overvotes = row["total_over_votes"]
                  total_count.undervotes = row["total_under_votes"]
                  contest.contest_total_counts_by_gp_unit << total_count
                end
              end
            end
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
            candidate_selection = Vssc::Party.new
            candidate_selection.object_id = "party-#{candidate.id}"
            contest.ballot_selections << candidate_selection
          end
          # Straight Party
        
        else
          # Don't record generic ballot text
          next
        end
      
        # For whatever the contest, look at all the precinct-splits in the contest/precinct-split
        # and detect an exatly-matching district
        # puts c.relations(:district_contest).collect(&:district_id).join(", ")
        district_id = c.relations(:district_contest).last.district_id
        contest.contest_gp_scope = jurisdiction.districts.where(internal_id: district_id).first.object_id

        contest.object_id = "contest-#{c.id}"
        contest.name = c.office
        contest.sequence_order = c.order
        #:order, :id, :office, :contest_type, :instruction_text, :ballot_measure_title
      
      
        election.contests << contest
      end
    
      puts report.valid?
      puts report.errors.messages.collect{|k,v|"#{k}: #{v}"}.join("\n")
      
      return report
      
      #File.open(report.object_id + "#{include_results ? '-results' : ''}-vssc.xml", "w+") do |f|
      #  f.write report.to_xml_node.doc.to_s
      #end
    
      
      
    end
  end
end
