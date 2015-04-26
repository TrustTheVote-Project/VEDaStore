class Vssc::BallotStyle < ActiveRecord::Base
  include VsscFunctions
  
  define_element("OrderedContest", method: :ordered_contests, type: OrderedContest)
  has_and_belongs_to_many :ordered_contests
  
  define_element("GPUnit")
  define_attribute("object_id", :required=>true)
  define_attribute("ballotStyleID")
  
end
