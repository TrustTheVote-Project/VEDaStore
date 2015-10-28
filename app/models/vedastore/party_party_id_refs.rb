class Vssc::PartyPartyIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :coalition, foreign_key: :party_id
  belongs_to :party, primary_key: :object_id, foreign_key: :party_id_ref, class_name: "Vssc::Party"
  
  define_text_node(:party_id_ref)
  

end