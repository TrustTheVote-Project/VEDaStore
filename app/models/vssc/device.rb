class Vssc::Device < VSSC::GPUnit
  define_attribute("deviceType", type: Vssc::DeviceType, required: true)
  define_attribute("manufacturer")
  define_attribute("serialNumber")
  
end
