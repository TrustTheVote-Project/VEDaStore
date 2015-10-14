# <xsd:simpleType name="BallotMeasureType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="ballot-measure"/>
#     <xsd:enumeration value="initiative"/>
#     <xsd:enumeration value="referendum"/>
#     <xsd:enumeration value="other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::BallotMeasureType
  include VsscEnum
  
  set_enum_values "ballot-measure",
                  "initiative",
                  "other",
                  "referendum"

end