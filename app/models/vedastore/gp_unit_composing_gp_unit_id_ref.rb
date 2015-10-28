class Vssc::GpUnitComposingGpUnitIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :gp_unit
  belongs_to :composing_gp_unit, primary_key: :object_id, foreign_key: :composing_gp_unit_id_ref, class_name: "Vssc::GpUnit"
  
  define_text_node(:composing_gp_unit_id_ref)
  

end