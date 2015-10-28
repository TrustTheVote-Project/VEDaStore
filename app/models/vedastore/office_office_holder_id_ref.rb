class Vssc::OfficeOfficeHolderIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :office
  belongs_to :office_holder, primary_key: :object_id, foreign_key: :office_holder_id_ref, class_name: "Vssc::Person"
  
  define_text_node(:office_holder_id_ref)
  

end