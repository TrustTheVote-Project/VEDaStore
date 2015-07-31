# <xsd:complexType name="CandidateSelection">
#   <xsd:complexContent>
#     <xsd:extension base="BallotSelection">
#       <xsd:sequence>
#         <xsd:element name="CandidateId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="EndorsementPartyId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#       </xsd:sequence>
#       <xsd:attribute name="IsWriteIn" type="xsd:boolean"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::CandidateSelection < Vssc::BallotSelection
  
  define_element("CandidateId", type: String, method: :candidate_ids)
  has_many :ballot_selection_candidate_ids
  has_many :candidate_ids, through: :ballot_selection_candidate_ids
  
  
  define_element("EndorsementPartyId", type: String, method: :party_ids)
  has_many :ballot_selection_party_ids
  has_many :party_ids, through: :ballot_selection_party_ids
  
  define_attribute("IsWriteIn", type: "xsd:boolean", method: :is_write_in)
  
  
end
