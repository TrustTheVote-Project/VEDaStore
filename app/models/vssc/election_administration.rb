# <xsd:complexType name="ElectionAdministration">
#   <xsd:sequence>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#     <xsd:element name="ElectionOfficialPersonId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Name" type="xsd:string" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>
class Vssc::ElectionAdministration < ActiveRecord::Base
  include VsscFunctions
  
  define_element("ContactInformation", type: Vssc::ContactInformation)
  define_element("ElectionOfficialPersonId")
  
  define_element("ElectionOfficialPersonId", type: Vssc::ElectionAdministrationOfficialIdRef, method: :election_official_person_id_refs)
  has_many :election_official_person_id_refs
  has_many :election_officials, through: :election_official_person_id_refs
  
  
  define_element("Name")
  
end