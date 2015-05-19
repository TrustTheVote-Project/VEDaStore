class Vssc::District < Vssc::GPUnit
  define_attribute("districtType", type: Vssc::DistrictType, required: true) 
  
  def district_type
    ocd_object.districts.last.vssc_type
  end
    
end
