class Vssc::BallotStyleGpUnitIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :ballot_style
  belongs_to :gp_unit, primary_key: :object_id, foreign_key: :gp_unit_id_ref, class_name: "Vssc::GpUnit"
  
  define_text_node(:gp_unit_id_ref)
  

end