# <xsd:complexType name="Office">
#   <xsd:sequence>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#     <xsd:element name="JurisdictionalScopeId" type="xsd:IDREF" minOccurs="0"/>
#     <xsd:element name="Name" type="InternationalizedText"/>
#     <xsd:element name="OfficeHolderId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Term" type="Term" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
#   <xsd:attribute name="FilingDeadline" type="xsd:date"/>
#   <xsd:attribute name="IsPartisan" type="xsd:boolean"/>
# </xsd:complexType>
class Vssc::Office < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("ContactInformation", type: Vssc::ContactInformation, belongs_to: true)
  
  define_element("JurisdictionalScopeId")

  define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_element("OfficeHolderId", type: String, method: :office_holder_ids)
  has_many :office_office_holders
  has_many :office_holder_ids, through: :office_office_holders
  
  define_elemnt("Term", type: Vssc::Term, belongs_to: true)
  
  define_attribute("ObjectId", required: true)
  define_attribute("FilingDeadline", type: "xsd:dateTime")
  define_attribute("IsPartisan", type: "xsd:boolean")
  
  
end
