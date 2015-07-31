# <xsd:simpleType name="BallotMeasureType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="BallotMeasure"/>
#     <xsd:enumeration value="Initiative"/>
#     <xsd:enumeration value="Other"/>
#     <xsd:enumeration value="Referendum"/>
#     <xsd:enumeration value="Retention"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::BallotMeasureType
  include VsscEnum
  
  set_enum_values "BallotMeasure",
                  "Initiative",
                  "Other",
                  "Referendum",
                  "Retention"

end