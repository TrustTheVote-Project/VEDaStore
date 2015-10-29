class Vedastore::ElectionAdministrationOfficialIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::ElectionAdministrationOfficialIdRef
  
  belongs_to :election_administration
  belongs_to :election_official, primary_key: :object_id, foreign_key: :election_official_id_ref, class_name: "Vedastore::Person"
  
end