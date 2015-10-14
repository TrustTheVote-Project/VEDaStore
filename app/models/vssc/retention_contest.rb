# <xsd:complexType name="RetentionContest">
#   <xsd:complexContent>
#     <xsd:extension base="BallotMeasureContest">
#       <xsd:sequence>
#         <xsd:element name="CandidateId" type="xsd:IDREF"/>
#         <xsd:element name="OfficeId" type="xsd:IDREF" minOccurs="0"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::RetentionContest < Vssc::BallotMeasureContest
  
  define_element("CandidateId", method :candidate_identifier)
  define_element("OfficeId", method :office_identifier)
  
end