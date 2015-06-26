class Vssc::BallotSelection < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :contest
  
  has_many :candidate_selection_candidate_refs, foreign_key: :candidate_selection_id
  
  
  define_element("VoteCounts", type: Vssc::VoteCount, method: :counts)
  has_many :counts
  
  define_attribute("object_id", :required=>true)
  define_attribute("ballotSelectionID")
  
  def totals
    self.counts.group(:ballot_type).sum(:count)
  end
  
  def name
  end
  
end