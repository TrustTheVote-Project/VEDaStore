require 'csv'
class Vssc::ElectionReport < ActiveRecord::Base
  
  include VsscFunctions
  
  has_one :election_report_upload
  delegate :jurisdiction, to: :election_report_upload
  
  define_element("Message")
  define_element("GPUnitCollection", type: Vssc::GPUnit, method: :gp_units, passthrough: "GPUnit")
  has_and_belongs_to_many :gp_units, :class_name=>"Vssc::GPUnit"
  
  define_element("PartyCollection", type: Vssc::Party, method: :parties, passthrough: "Party")
  has_and_belongs_to_many :parties
  define_element("PersonCollection", type: Vssc::Person, method: :people, passthrough: "Person")
  has_and_belongs_to_many :people
  define_element("OfficeCollection", type: Vssc::Office, method: :offices, passthrough: "Office")
  has_and_belongs_to_many :offices
  
  
  define_element("Election", method: :elections, type: Vssc::Election)
  has_many :elections
  
  
  define_attribute("object_id", required: true)
  define_attribute("date", required: true, type: "xsd:dateTime")
  define_attribute("format", required: true, type: Vssc::ReportFormat)
  define_attribute("status", required: true, type: Vssc::ReportStatus)
  define_attribute("issuer", required: true)
  define_attribute("sequence", required: true, type: Fixnum)
  define_attribute("sequenceEnd", required: true, type: Fixnum)
  define_attribute("stateAbbreviation", required: true)
  define_attribute("stateCode")
  define_attribute("vendorApplicationID", required: true)
  
  
  def parse_hart_dir(dest, source_id)
    Hart::Parser.parse(dest, self, source_id)
  end
  
  attr_reader :election_results_csv
  def election_results_csv=(file)
    rows = CSV.parse(file.read.scrub, headers: true)
    puts rows.length
    rows.each_with_index do |row, i|
      puts "Row #{i}"
      contest_id = row['Contest_Id']
      puts contest_id
      # TODO: shouldn't use elections.first
      contest = self.elections.first.contests.where(object_id: "contest-#{contest_id}").first
      candidate_id = row['candidate_id']
      candidate_type = row["Candidate_Type"].to_s.downcase # C vs W for write-in
      candidate_selection = nil
      if contest.is_a?(Vssc::CandidateChoice)
        if candidate_type == "c"
          candidate_selection = contest.ballot_selections.where(object_id: "candidate-selection-#{candidate_id}").first
        elsif candidate_type == "w"
          #Add a write-in option
          #see if it's already added
          candidate_selection = contest.ballot_selections.where(object_id:  "candidate-selection-#{candidate_id}", is_write_in: true, type: Vssc::CandidateSelection).first
          if candidate_selection.nil?
            candidate_selection= Vssc::CandidateSelection.new
            candidate_selection.is_write_in = true
            candidate_selection.object_id = "candidate-selection-#{candidate_id}"
            candidate_selection.candidate_selection_candidate_refs << Vssc::CandidateSelectionCandidateRef.new(object_id: "candidate-#{candidate_id}")
            e = self.elections.first
            e.candidates << Vssc::Candidate.new(
              object_id: "candidate-#{candidate_id}",
              ballot_name: row["candidate_name"]
            )
            e.save!
            contest.ballot_selections << candidate_selection
          end
        end
      elsif contest.is_a?(Vssc::StraightParty)
        candidate_selection = contest.ballot_selections.where(object_id: "party-#{candidate_id}").first
      elsif contest.is_a?(Vssc::BallotMeasure)        
        candidate_selection = contest.ballot_selections.where(object_id: "ballot-measure-selection-#{candidate_id}").first
      end
      if candidate_selection.nil?
        raise "No candidate selection for contest #{contest.type} #{contest.id}, candidate #{candidate_id}"
      end
      cc = "#{contest_id}-#{candidate_id}"
    
      vc_a = Vssc::VoteCount.new
      vc_e = Vssc::VoteCount.new
      vc = Vssc::VoteCount.new
      
      # find the precinct split with this ID
      ps = self.gp_units.where(object_id: "vspub-precinct-split-#{row["Pct_Id"]}").first
      vc_e.gp_unit = vc.gp_unit = vc_a.gp_unit = ps.object_id
      vc_a.object_id = "votecount-#{cc}-absentee"
      vc_a.ballot_type = Vssc::BallotType.absentee
      vc_a.count = row["absentee_votes"]
      vc_e.object_id = "votecount-#{cc}-early"
      vc_e.ballot_type = Vssc::BallotType.early
      vc_e.count = row["early_votes"]
      vc.object_id = "votecount-#{cc}-election-day"
      vc.ballot_type = Vssc::BallotType.election_day
      vc.count = row["election_votes"]
      # TODO: need to lookup the candidate_selection
      candidate_selection.vote_counts << vc
      candidate_selection.vote_counts << vc_a
      candidate_selection.vote_counts << vc_e
      
      # for the first candidate in the loop put in the totals
      if contest.contest_total_counts_by_gp_unit.size == 0
        total_count = Vssc::TotalCount.new
        total_count.gp_unit = ps.object_id
        total_count.object_id = "total-counts-#{total_count.gp_unit}-#{contest_id}"
        total_count.ballots_cast = row["total_ballots"]
        total_count.overvotes = row["total_over_votes"]
        total_count.undervotes = row["total_under_votes"]
        contest.contest_total_counts_by_gp_unit << Vssc::ContestTotalCountsByGPUnit.new(total_count: total_count)
      end
      #candidate_selection.save!
      contest.save!
    end
    # TODO: when uploading results, change the report status. To what?
    self.status = Vssc::ReportStatus.unofficial_complete
    self.save!  
  end
  
  
  def self.from_jurisdiction(j)
    er = self.new
    er.object_id = "VSPubJurisdictionReport-#{j.id}-#{DateTime.now}"
    er.date = DateTime.now
    er.format = Vssc::ReportFormat.summary_contest
    er.status = Vssc::ReportFormat.pre_election
    er.issuer = "VSPub"
    er.state_abbreviation = j.state_abbreviation
    er.vendor_application_id = "VSPub-<some-deployment-specific-guid>"
    
    j.districts.each do |d|
      district = Vssc::District.new
      district.district_type = d.vssc_type
      
      d.reporting_units.each do |ru|
        district.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id: ru.object_id)
      end
      
      district.object_id = d.object_id
      district.local_geo_code = d.internal_id
      district.name = d.name
      district.national_geo_code = d.ocd_id
      
      er.gp_units << district
    end
    
    j.reporting_units.each do |ru|
      reporting_unit = Vssc::ReportingUnit.new

      reporting_unit.object_id = ru.object_id
      reporting_unit.local_geo_code = ru.internal_id
      reporting_unit.name = ru.name
      reporting_unit.national_geo_code = ru.ocd_id
      
      reporting_unit.reporting_unit_type = Vssc::ReportingUnitType.precinct      
      
      er.gp_units << reporting_unit      
    end
    return er
  end
  
  def xml_attributes_hash_with_root(node_name)
    attr_hash = xml_attributes_hash_without_root(node_name)
    attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
    attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/fake_url"
    attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/fake_url file:///G:/1622.2/ElectionResultsV29.xsd"
    return attr_hash
  end
  
  alias_method_chain :xml_attributes_hash, :root
  
end
