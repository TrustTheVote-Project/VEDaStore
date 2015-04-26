class Vssc::PartyRegistration < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Party", type: String)
  define_attribute("object_id", required: true)
  define_attribute("count", required: true, type: Fixnum)
  
end
