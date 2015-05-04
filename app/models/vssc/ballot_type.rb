# <xsd:simpleType name="BallotType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="absentee"/>
#     <xsd:enumeration value="absentee-FWAB"/>
#     <xsd:enumeration value="absentee-in-person"/>
#     <xsd:enumeration value="absentee-mail"/>
#     <xsd:enumeration value="absentee-UOCAVA"/>
#     <xsd:enumeration value="early"/>
#     <xsd:enumeration value="election-day"/>
#     <xsd:enumeration value="other"/>
#     <xsd:enumeration value="provisional"/>
#     <xsd:enumeration value="total"/>
#     <xsd:enumeration value="UOCAVA"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::BallotType
  include Vssc::Enum
  
  set_enum_values "absentee",
                  "absentee-FWAB",
                  "absentee-in-person",
                  "absentee-mail",
                  "absentee-UOCAVA",
                  "early",
                  "election-day",
                  "other",
                  "provisional",
                  "total",
                  "UOCAVA"

end