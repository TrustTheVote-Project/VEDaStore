# <xsd:complexType name="ReportingUnit">
#   <xsd:complexContent>
#     <xsd:extension base="GpUnit">
#       <xsd:sequence>
#         <xsd:element name="AuthorityId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#         <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="ElectionAdministration" type="ElectionAdministration" minOccurs="0"/>
#         <xsd:element name="IsDistricted" type="xsd:boolean" minOccurs="0"/>
#         <xsd:element name="IsMailOnly" type="xsd:boolean" minOccurs="0"/>
#         <xsd:element name="Number" type="xsd:string" minOccurs="0"/>
#         <xsd:element name="PartyRegistration" type="PartyRegistration" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="SpatialDimension" type="SpatialDimension" minOccurs="0"/>
#         <xsd:element name="SubUnitsReported" type="xsd:integer" minOccurs="0"/>
#         <xsd:element name="TotalSubUnits" type="xsd:integer" minOccurs="0"/>
#         <xsd:element name="Type" type="ReportingUnitType"/>
#         <xsd:element name="OtherType" type="xsd:string" minOccurs="0"/>
#         <xsd:element name="VotersParticipated" type="xsd:integer" minOccurs="0"/>
#         <xsd:element name="VotersRegistered" type="xsd:integer" minOccurs="0"/>
#       </xsd:sequence>
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

  define_element("ElectionAdministration", type: Vssc::ElectionAdministration, belongs_to: true)
  define_element("IsDistricted", type: "xsd:boolean")
  define_element("IsMailOnly", type: "xsd:boolean")
  define_element("Number")
  
  define_element("PartyRegistration", type: Vssc::PartyRegistration, method: :party_registrations)
  has_many :party_registrations, as: :party_registrationable
  
  define_element("SpatialDimension", type: Vssc::SpatialDimension, belongs_to: true)
  define_element("SubUnitsReported", type: Fixnum)
  define_element("TotalSubUnits", type: Fixnum)
  define_element("Type", type: Vssc::Enum::ReportingUnitType, required: true, method: :reporting_unit_type)
  define_element("OtherType")
  define_element("VotersParticipated", type: Fixnum)
  define_element("VotersRegistered", type: Fixnum)
  
end
