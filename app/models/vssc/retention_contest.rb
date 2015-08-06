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
  
  define_element("CandidateId")
  define_element("OfficeId")
  
end