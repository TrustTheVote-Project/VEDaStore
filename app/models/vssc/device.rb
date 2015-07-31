# <xsd:complexType name="Device">
#   <xsd:attribute name="Manufacturer" type="xsd:string"/>
#   <xsd:attribute name="Model" type="xsd:string"/>
#   <xsd:attribute name="Type" type="DeviceType"/>
# </xsd:complexType>
class Vssc::Device < Vssc::GPUnit
  define_attribute("Manufacturer")
  define_attribute("Model")
  define_attribute("Type", type: Vssc::DeviceType, method: :device_type)
  
end
