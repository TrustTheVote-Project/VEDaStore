class Vssc::Count < ActiveRecord::Base
  include VsscFunctions
  
  define_element("GPUnit")
  #has_one :gp_unit_ref - via GPUnit string object_id
  
  
  
  define_attribute("object_id", required: true)
  define_attribute("ballotType", type: Vssc::BallotType)
  
  define_attribute("deviceManufacturer")
  define_attribute("deviceModel")
  define_attribute("deviceType", type: Vssc::DeviceType)
end
