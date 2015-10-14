#     <xsd:element name="Term" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="StartDate" type="xsd:date" minOccurs="0"/>
#           <xsd:element name="EndDate" type="xsd:date" minOccurs="0"/>
#           <xsd:element name="Type" type="OfficeTermType" minOccurs="0"/>
#         </xsd:sequence>
#         <xsd:attribute name="label" type="xsd:string"/>
#       </xsd:complexType>
#     </xsd:element>

class Vssc::Term < ActiveRecord::Base
  include VsscFunctions
  
  define_element("StartDate", type: Date)
  define_element("EndDate", type: Date)
  define_element("Type", type: Vssc::Enum::OfficeTermType, method: :office_term_type)
  
  define_attribute("label")
  
end
