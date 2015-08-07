# <xsd:complexType name="Device">
#   <xsd:attribute name="Manufacturer" type="xsd:string"/>
#   <xsd:attribute name="Model" type="xsd:string"/>
#   <xsd:attribute name="Type" type="DeviceType"/>
# </xsd:complexType>
class Vssc::Device < ActiveRecord::Base
  include VsscFunctions
  
  define_attribute("Manufacturer")
  define_attribute("Model")
  define_attribute("Type", type: Vssc::Enum::DeviceType, method: :device_type)
  
end
