# <xsd:complexType name="Device">
#   <xsd:sequence>
#     <xsd:element name="Manufacturer" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Model" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Type" type="DeviceType" minOccurs="0"/>
#     <xsd:element name="OtherType" type="xsd:string" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>


class Vssc::Device < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Manufacturer")
  define_element("Model")
  define_element("Type", type: Vssc::Enum::DeviceType, method: :device_type)
  define_element("OtherType")
  
end
