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
  
  define_element("PartyId", type: String, method: :party_selection_party_id_refs)
  has_many :party_selection_party_id_refs
  #has_many :parties, through: :party_selection_party_ids
  
end
