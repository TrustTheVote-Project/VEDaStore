# <xsd:complexType name="Party">
#   <xsd:sequence>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Name" type="InternationalizedText"/>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
#   <xsd:attribute name="Abbreviation" type="xsd:string"/>
#   <xsd:attribute name="Color" type="HtmlColorString"/>
#   <xsd:attribute name="LogoUri" type="xsd:anyURI"/>
# </xsd:complexType>
class Vssc::Party < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election_report
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)

  define_attribute("ObjectId", required: true)
  define_attribute("Abbreviation")
  define_attribute("Color")
  define_attribute("LogoUri")
  
end
