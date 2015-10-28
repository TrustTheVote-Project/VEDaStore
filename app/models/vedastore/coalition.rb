# <xsd:complexType name="Coalition">
#   <xsd:complexContent>
#     <xsd:extension base="Party">
#       <xsd:sequence>
#         <xsd:element name="ContestId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::Coalition < Vssc::Party
  
  define_element("ContestId", type: Vssc::PartyContestIdRef, method: :party_contest_id_refs)
  has_many :party_contest_id_refs
  has_many :contests, through: :party_contest_id_refs
  
  define_element("PartyId", type: Vssc::PartyPartyIdRef, method: :party_party_id_refs)
  has_many :party_party_id_refs
  has_many :parties, through: :party_party_id_refs
  
end
