class Vedastore::PartyPartyIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::PartyPartyIdRef
  
  belongs_to :coalition, foreign_key: :party_id
  belongs_to :party, primary_key: :object_id, foreign_key: :party_id_ref, class_name: "Vedastore::Party"
  
  define_text_node(:party_id_ref)
  

end