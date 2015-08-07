# <xsd:complexType name="ReportingUnit">
#   <xsd:complexContent>
#     <xsd:extension base="GpUnit">
#       <xsd:sequence>
#         <xsd:element name="AuthorityId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#         <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="PartyRegistration" type="PartyRegistration" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="SpatialDimension" type="SpatialDimension" minOccurs="0"/>
#       </xsd:sequence>
#       <xsd:attribute name="IsElectoralDistrict" type="xsd:boolean"/>
#       <xsd:attribute name="OtherType" type="xsd:string"/>
#       <xsd:attribute name="SubUnitsReported" type="xsd:integer"/>
#       <xsd:attribute name="TotalSubUnits" type="xsd:integer"/>
#       <xsd:attribute name="Type" type="ReportingUnitType" use="required"/>
#       <xsd:attribute name="VotersParticipated" type="xsd:integer"/>
#       <xsd:attribute name="VotersRegistered" type="xsd:integer"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::ReportingUnit < Vssc::GpUnit

  define_element("AuthorityId", type: Vssc::GpUnitAuthorityIdRef, method: :gp_unit_authority_id_refs)
  has_many :gp_unit_authority_id_refs, foreign_key: :gp_unit_id
  has_many :authorities, through: :gp_unit_authority_id_refs
  
  define_element("ContactInformation", type: Vssc::ContactInformation, belongs_to: true)
  
  define_element("CountStatus", type: Vssc::CountStatus, method: :count_statuses)
  has_many :count_statuses, as: :count_statusable

  define_element("PartyRegistration", type: Vssc::PartyRegistration, method: :party_registrations)
  has_many :party_registrations, as: :party_registrationable
  
  define_element("SpatialDimension", type: Vssc::SpatialDimension, belongs_to: true)

  define_attribute("IsElectoralDistrict", type: "xsd:boolean")
  define_attribute("OtherType")
  define_attribute("SubUnitsReported", type: Fixnum)
  define_attribute("TotalSubUnits", type: Fixnum)
  define_attribute("Type", type: Vssc::Enum::ReportingUnitType, required: true, method: :reporting_unit_type)
  define_attribute("VotersParticipated", type: Fixnum)
  define_attribute("VotersRegistered", type: Fixnum)
  
end
