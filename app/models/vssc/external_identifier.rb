# <xsd:complexType name="ExternalIdentifiers">
#   <xsd:sequence>
#     <xsd:element name="ExternalIdentifier" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Type" type="IdentifierType"/>
#           <xsd:element name="OtherType" type="xsd:string" minOccurs="0"/>
#           <xsd:element name="Value" type="xsd:string"/>
#         </xsd:sequence>
#         <xsd:attribute name="label" type="xsd:string"/>
#       </xsd:complexType>
#     </xsd:element>
#   </xsd:sequence>
#   <xsd:attribute name="label" type="xsd:string"/>
# </xsd:complexType>
class Vssc::ExternalIdentifier < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :external_identifier_collection
  
  define_element("Type", type: Vssc::Enum::IdentifierType, method: :identifier_type, required:true)
  define_element("OtherType")  
  define_element("Value", required: true)

  define_attribute("label")
  
end
