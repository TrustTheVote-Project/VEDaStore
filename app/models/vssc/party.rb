class Vssc::Party < ActiveRecord::Base
  include VsscFunctions
  
  has_and_belongs_to_many :election_reports
  
  define_attribute("abbreviation")
  define_attribute("localPartyCode")
  define_attribute("name")
  define_attribute("nationalPartyCode")
  define_attribute("statePartyCode")
  
  
end
