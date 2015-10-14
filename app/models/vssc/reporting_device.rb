# <xsd:complexType name="ReportingDevice">
#   <xsd:complexContent>
#     <xsd:extension base="GpUnit">
#       <xsd:sequence>
#         <xsd:element name="Device" type="Device" minOccurs="0"/>
#         <xsd:element name="SerialNumber" type="xsd:string" minOccurs="0"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::ReportingDevice < Vssc::GpUnit
  
  define_element("Device", type: Vssc::Device, belongs_to: true)
  define_element("SerialNumber")
  
end

