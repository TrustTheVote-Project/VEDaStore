class Vssc::ElectionAdministrationOfficialIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election_administration
  belongs_to :election_official, primary_key: :object_id, foreign_key: :election_official_id_ref, class_name: "Vssc::Person"
  
  define_text_node(:election_official_id_ref)
  
end