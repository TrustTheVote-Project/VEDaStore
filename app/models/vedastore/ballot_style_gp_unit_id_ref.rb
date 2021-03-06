class Vedastore::BallotStyleGpUnitIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :ballot_style
  belongs_to :gp_unit, primary_key: :object_id, foreign_key: :gp_unit_id_ref, class_name: "Vedastore::GpUnit"
  include Vedaspace::BallotStyleGpUnitIdRef
  
  

end