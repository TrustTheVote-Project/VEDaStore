class Vedastore::BallotStylePartyIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :ballot_style
  belongs_to :party, primary_key: :object_id, foreign_key: :party_id_ref, class_name: "Vedastore::Party"
  include Vedaspace::BallotStylePartyIdRef
  

end