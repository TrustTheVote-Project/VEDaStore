class Vssc::Contest < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election
  
  define_element("BallotSelection", type: Vssc::BallotSelection, method: :ballot_selections)
  has_many :ballot_selections, class_name: "Vssc::BallotSelection", dependent: :destroy
  
  define_element("ContestGPScope")
  def contest_gp_scope_object
    election.election_report.gp_units.where(object_id: contest_gp_scope).first
  end
  define_element("ContestTotalCounts", type: Vssc::TotalCount, method: :total_counts)
  has_many :contest_total_counts, dependent: :destroy
  has_many :total_counts, through: :contest_total_counts
  
  
  
  define_element("ContestTotalCountsByGPUnit", type: Vssc::TotalCount, method: :total_counts_by_gp_unit)
  has_many :contest_total_counts_by_gp_unit, class_name: "Vssc::ContestTotalCountsByGPUnit", dependent: :destroy
  has_many :total_counts_by_gp_unit, through: :contest_total_counts_by_gp_unit, source: :total_count
  
  def total_ballots_cast
    self.total_counts_by_gp_unit.sum(:ballots_cast)
  end
  def total_overvotes
    self.total_counts_by_gp_unit.sum(:overvotes)
  end
  def total_undervotes
    self.total_counts_by_gp_unit.sum(:undervotes)
  end
  def total_write_ins
    self.total_counts_by_gp_unit.sum(:write_ins)
  end
  
  
  
  
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
