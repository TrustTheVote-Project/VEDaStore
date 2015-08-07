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
  
  belongs_to :office_group
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("ContactInformation", type: Vssc::ContactInformation, belongs_to: true)
  
  define_element("JurisdictionalScopeId", method: :jurisdictional_scope_identifier)

  define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_element("OfficeHolderId", type: Vssc::OfficeOfficeHolderIdRef, method: :office_office_holder_id_refs)
  has_many :office_office_holder_id_refs
  has_many :office_holders, through: :office_office_holder_id_refs
  
  define_element("Term", type: Vssc::Term, belongs_to: true)
  
  define_attribute("ObjectId", required: true)
  define_attribute("FilingDeadline", type: "xsd:dateTime")
  define_attribute("IsPartisan", type: "xsd:boolean")
  
  
end
