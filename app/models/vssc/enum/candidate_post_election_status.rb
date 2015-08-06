# <xsd:simpleType name="CandidatePostElectionStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="AdvancedToRunoff"/>
#     <xsd:enumeration value="ProjectedWinner"/>
#     <xsd:enumeration value="Winner"/>
#     <xsd:enumeration value="Withdrawn"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::CandidatePostElectionStatus
  include VsscEnum
  
  set_enum_values "AdvancedToRunoff",
                  "ProjectedWinner",
                  "Winner",
                  "Withdrawn"

end
