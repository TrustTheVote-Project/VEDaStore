# <xsd:complexType name="Party">
#   <xsd:sequence>
#     <xsd:element name="Abbreviation" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Color" type="HtmlColorString" minOccurs="0"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="LogoUri" type="xsd:anyURI" minOccurs="0"/>
#     <xsd:element name="Name" type="InternationalizedText"/>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>


class Vssc::Party < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election_report
  
  define_element("Abbreviation")
  define_element("Color")

  define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collection)
  has_one :external_identifier_collection, :as=>:identifiable

  define_element("LogoUri")
  
  define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)

  define_attribute("objectId", required: true)
  
end
