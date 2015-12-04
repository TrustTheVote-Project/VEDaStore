class Vedastore::ElectionAdministrationOfficialIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :election_administration
  belongs_to :election_official, primary_key: :object_id, foreign_key: :election_official_id_ref, class_name: "Vedastore::Person"
  include Vedaspace::ElectionAdministrationOfficialIdRef
  
end