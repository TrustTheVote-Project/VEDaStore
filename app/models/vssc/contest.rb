class Vssc::Contest < ActiveRecord::Base
  include VsscFunctions
  
  define_element("BallotSelection", type: Vssc::BallotSelection, method: :ballot_selections)
  has_and_belongs_to_many :ballot_selections
  
  define_element("ContestGPScope")
  define_element("ContestTotalCounts", type: Vssc::TotalCount, method: :total_counts)
  has_many :contest_total_counts
  has_many :total_counts, through: :contest_total_counts
  
  
  define_element("ContestTotalCountsByGPUnit", type: Vssc::TotalCount, method: :total_counts_by_gp_unit)
  has_many :contest_total_counts_by_gp_unit, class_name: "Vssc::ContestTotalCountsByGPUnit"
  has_many :total_counts_by_gp_unit, through: :contest_total_counts_by_gp_unit, source: :total_count
  
  define_attribute("object_id", required: true)
  define_attribute("abbreviation")
  define_attribute("localContestCode")
  define_attribute("name", required: true)
  define_attribute("nationalContestCode")
  define_attribute("reportedPrecincts", type: Fixnum)
  define_attribute("sequenceOrder", type: Fixnum)
  define_attribute("stateContestCode")
  define_attribute("totalPrecincts", type: Fixnum)
  define_attribute("voteVariation", type: Vssc::VoteVariation )
  
end
