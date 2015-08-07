class Vssc:ContestOfficeIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :contest
  belongs_to :office, primary_key: :object_id, foreign_key: :office_id_ref, class_name: "Vssc::Office"
  
  define_text_node(:office_id_ref)
  

end