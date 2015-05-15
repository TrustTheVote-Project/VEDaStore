class Vssc::BallotSelection < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :contest
  
  define_element("VoteCounts", type: Vssc::VoteCount, method: :vote_counts)
  has_and_belongs_to_many :vote_counts
  
  define_attribute("object_id", :required=>true)
  define_attribute("ballotSelectionID")
  
  def totals
    vote_counts.group(:ballot_type).sum(:count)
  end
  
  def name
  end
  
end