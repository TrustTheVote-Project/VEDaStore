# <xsd:complexType name="CandidateContest">
#   <xsd:complexContent>
#     <xsd:extension base="Contest">
#       <xsd:sequence>
#         <xsd:element name="OfficeId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#         <xsd:element name="PrimaryPartyId" type="xsd:IDREF" minOccurs="0"/>
#       </xsd:sequence>
#       <xsd:attribute name="NumberElected" type="xsd:integer"/>
#       <xsd:attribute name="VotesAllowed" type="xsd:integer" use="required"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::CandidateContest < Vssc::Contest

  define_element("OfficeId", type: String, method: :office_ids)
  has_many :contest_office_ids
  has_many :office_ids, through: :contest_office_ids
  
  define_element("PrimaryPartyId", method: :primary_party)
  
  define_attribute("NumberElected", type: Fixnum)
  define_attribute("VotesAllowed", type: Fixnum, required: true)
  
end