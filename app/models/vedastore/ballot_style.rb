class Vedastore::BallotStyle < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :election
  has_one :external_identifier_collection, :as=>:identifiable
  has_many :ordered_contests
  has_many :ballot_style_gp_unit_id_refs
  has_many :gp_units, through: :ballot_style_gp_unit_id_refs
  has_many :ballot_style_party_id_refs
  has_many :parties, through: :ballot_style_party_id_refs
  include Vedaspace::BallotStyle
  
end
