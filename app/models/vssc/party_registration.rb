class Vssc::PartyRegistration < ActiveRecord::Base
  include VsscFunctions
  
  has_one :gp_unit, class_name: "Vssc::GPUnit"
  
  define_element("Party", type: String)
  define_attribute("object_id", required: true)
  define_attribute("count", required: true, type: Fixnum)
  
end
