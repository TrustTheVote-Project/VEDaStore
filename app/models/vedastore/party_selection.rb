class Vedastore::PartySelection < Vedastore::BallotSelection
  include XsdRailsFunctions
  include Vedaspace::PartySelection
  
  has_many :ballot_selection_party_id_refs
  has_many :parties, through: :ballot_selection_party_id_refs
  
end