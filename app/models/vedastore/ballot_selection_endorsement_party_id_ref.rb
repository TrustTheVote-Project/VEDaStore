class Vedastore::BallotSelectionEndorsementPartyIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :ballot_selection
  belongs_to :endorsement_party, primary_key: :object_id, foreign_key: :endorsement_party_id_ref, class_name: "Vedastore::Party"
  include Vedaspace::Election
  
end