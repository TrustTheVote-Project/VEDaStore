class Vssc::Election < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election_report
  
  define_element("BallotStyleCollection", type: Vssc::BallotStyle, method: :ballot_styles, passthrough: "BallotStyle")
  has_and_belongs_to_many :ballot_styles
  
  define_element("CandidateCollection", type: Vssc::Candidate, method: :candidates, passthrough: "Candidate")
  has_and_belongs_to_many :candidates
  
  define_element("ContestCollection", type: Vssc::Contest, method: :contests, passthrough: "Contest")
  has_and_belongs_to_many :contests
  
  define_element("ElectionGPScope", method: :election_gp_scope)
  
  define_attribute("object_id", required: true)
  define_attribute("name", required: true)
  define_attribute("type", required: true, type: Vssc::ElectionType)
  define_attribute("date", required: true, type: Date)
  define_attribute("URL")
  
  define_attribute("absenteeCountStatus", type: Vssc::BallotCountStatus)
  define_attribute("earlyCountStatus", type: Vssc::BallotCountStatus)
  define_attribute("electionDayCountStatus", type: Vssc::BallotCountStatus)
  define_attribute("provisionalCountStatus", type: Vssc::BallotCountStatus)
  define_attribute("writeInCountStatus", type: Vssc::BallotCountStatus)
  
end
