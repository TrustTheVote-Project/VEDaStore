class Vedastore::ElectionAdministration < ActiveRecord::Base
  include XsdRailsFunctions
  
  has_many :election_official_person_id_refs
  has_many :election_officials, through: :election_official_person_id_refs
  include Vedaspace::ElectionAdministration
  
end