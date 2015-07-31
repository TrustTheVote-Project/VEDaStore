# <xsd:complexType name="Coalition">
#   <xsd:complexContent>
#     <xsd:extension base="Party">
#       <xsd:sequence>
#         <xsd:element name="ContestId" type="xsd:IDREF"/>
#         <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::Coalition < Vssc::Party
  
  define_element("ContestId")
  
  define_element("PartyId", type: String, method: :party_ids)
  has_many :party_party_ids
  has_many :party_ids, through: :party_party_ids
  
end
