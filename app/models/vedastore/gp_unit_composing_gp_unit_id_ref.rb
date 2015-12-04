class Vedastore::GpUnitComposingGpUnitIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :gp_unit
  belongs_to :composing_gp_unit, primary_key: :object_id, foreign_key: :composing_gp_unit_id_ref, class_name: "Vedastore::GpUnit"

  include Vedaspace::GpUnitComposingGpUnitIdRef
  

end