# <xsd:simpleType name="CountItemType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Absentee"/>
#     <xsd:enumeration value="AbsenteeFwab"/>
#     <xsd:enumeration value="AbsenteeInPerson"/>
#     <xsd:enumeration value="AbsenteeMail"/>
#     <xsd:enumeration value="Early"/>
#     <xsd:enumeration value="ElectionDay"/>
#     <xsd:enumeration value="Provisional"/>
#     <xsd:enumeration value="Total"/>
#     <xsd:enumeration value="Uocava"/>
#     <xsd:enumeration value="WriteIn"/>
#     <xsd:enumeration value="Other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::CountItemType
  include VsscEnum
  
  set_enum_values "Absentee",
                  "AbsenteeFwab",
                  "AbsenteeInPerson",
                  "AbsenteeMail",
                  "Early",
                  "ElectionDay",
                  "Provisional",
                  "Total",
                  "Uocava",
                  "WriteIn",
                  "Other",
                  
end
