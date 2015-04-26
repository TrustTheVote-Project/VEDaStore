class Vssc::GpSubUnitRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :gp_unit
  belongs_to :gp_unit_ref, class_name: "Vssc::GpUnit", foreign_key: :object_id, primary_key: :object_id
end
