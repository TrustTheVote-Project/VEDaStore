class Vssc::GpUnitAuthorityIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :gp_unit
  belongs_to :authority, primary_key: :object_id, foreign_key: :authority_id_ref, class_name: "Vssc::Person"
  
  define_text_node(:authority_id_ref)
  
end