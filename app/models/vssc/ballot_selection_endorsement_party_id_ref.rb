class Vssc:BallotSelectionEndorsementPartyIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :ballot_selection
  belongs_to :endorsement_party, primary_key: :object_id, foreign_key: :endorsement_party_id_ref, class_name: "Vssc::Party"
  
  define_text_node(:endorsement_party_id_ref)
  

end