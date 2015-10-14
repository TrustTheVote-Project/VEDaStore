# <xsd:complexType name="Person">
#   <xsd:sequence>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="DateOfBirth" type="xsd:date" minOccurs="0"/>
#     <xsd:element name="FirstName" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="FullName" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="Gender" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="LastName" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="MiddleName" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Nickname" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0"/>
#     <xsd:element name="Prefix" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Profession" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="Suffix" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Title" type="InternationalizedText" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>


class Vssc::Person < ActiveRecord::Base
  include VsscFunctions

  belongs_to :election_report
  
  define_element("ContactInformation", type: Vssc::ContactInformation, method: :contact_informations)
  has_many :contact_informations, as: :contactable

  define_element("DateOfBirth", type: Date)
  define_element("FirstName")
  define_element("FullName", type: Vssc::InternationalizedText, belongs_to: true)
  define_element("Gender")
  define_element("LastName")
  define_element("MiddleName", type: String, method: :middle_names)
  serialize :middle_names, Array
  define_element("Nickname")
  define_element("PartyId", method: :party_identifier)
  define_element("Prefix")
  define_element("Profession", type: Vssc::InternationalizedText, belongs_to: true)
  define_element("Suffix")
  define_element("Title", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_attribute("objectId", required: true)

end
