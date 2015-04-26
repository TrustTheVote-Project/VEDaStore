class Vssc::BallotSelection < ActiveRecord::Base
  include VsscFunctions
  
  has_and_belongs_to_many :contests
  
  define_element("VoteCounts", type: Vssc::VoteCount, method: :vote_counts)
  has_and_belongs_to_many :vote_counts
  
  define_attribute("object_id", :required=>true)
  define_attribute("ballotSelectionID")
  
end