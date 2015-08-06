# <xsd:simpleType name="CandidatePreElectionStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Filed"/>
#     <xsd:enumeration value="Qualified"/>
#     <xsd:enumeration value="Withdrawn"/>
#     <xsd:enumeration value="WriteIn"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::CandidatePreElectionStatus
  include VsscEnum
  
  set_enum_values "Filed",
                  "Qualified",
                  "Withdrawn",
                  "WriteIn"

end
