# <xsd:simpleType name="DistrictType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="congressional"/>
#     <xsd:enumeration value="local"/>
#     <xsd:enumeration value="locality"/>
#     <xsd:enumeration value="other"/>
#     <xsd:enumeration value="state-house"/>
#     <xsd:enumeration value="state-senate"/>
#     <xsd:enumeration value="statewide"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::DistrictType
  include VsscEnum
  
  set_enum_values "congressional",
                  "local",
                  "locality",
                  "other",
                  "state-house",
                  "state-senate",
                  "statewide"
  
  
end