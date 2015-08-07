# <xsd:complexType name="PartySelection">
#   <xsd:complexContent>
#     <xsd:extension base="BallotSelection">
#       <xsd:sequence>
#         <xsd:element name="PartyId" type="xsd:IDREF" maxOccurs="unbounded"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::PartySelection < Vssc::BallotSelection
  
  define_element("PartyId", type: Vssc::BallotSelectionPartyIdRef, method: :ballot_selection_party_id_refs)
  has_many :ballot_selection_party_id_refs
  has_many :parties, through: :ballot_selection_party_id_refs
  
end
