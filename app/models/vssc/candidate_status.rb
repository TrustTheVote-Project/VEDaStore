# <xsd:simpleType name="CandidateStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="advanced-to-runoff"/>
#     <xsd:enumeration value="filed"/>
#     <xsd:enumeration value="qualified"/>
#     <xsd:enumeration value="winner"/>
#     <xsd:enumeration value="withdrawn"/>
#     <xsd:enumeration value="writein"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::CandidateStatus
  include VsscEnum
  
  set_enum_values "advanced-to-runoff",
                  "filed",
                  "qualified",
                  "winner",
                  "withdrawn",
                  "writein"
  
  
  
end