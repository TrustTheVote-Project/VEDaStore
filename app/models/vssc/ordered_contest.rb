class Vssc::OrderedContest < ActiveRecord::Base
  include VsscFunctions
  
  has_and_belongs_to_many :ballot_styles
  
  define_element("Contest")
  
  define_element("BallotSelection", type: String, method: :ballot_selections)
  has_many :ordered_contest_ballot_selections
  has_many :ballot_selections, through: :ordered_contest_ballot_selections
  
  define_attribute("object_id", required: true)
  
end
