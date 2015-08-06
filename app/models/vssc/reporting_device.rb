# <xsd:complexType name="ReportingDevice">
#   <xsd:complexContent>
#     <xsd:extension base="GpUnit">
#       <xsd:sequence>
#         <xsd:element name="Device" type="Device" minOccurs="0"/>
#       </xsd:sequence>
#       <xsd:attribute name="SerialNumber" type="xsd:string"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::ReportingDevice < Vssc::GPUnit
  
  define_element("Device", type: Vssc::Device, belongs_to: true)
  
  define_attribute("SerialNumber")
  
end

