# <xsd:simpleType name="DayType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Sunday"/>
#     <xsd:enumeration value="Monday"/>
#     <xsd:enumeration value="Tuesday"/>
#     <xsd:enumeration value="Wednesday"/>
#     <xsd:enumeration value="Thursday"/>
#     <xsd:enumeration value="Friday"/>
#     <xsd:enumeration value="Saturday"/>
#     <xsd:enumeration value="Weekday"/>
#     <xsd:enumeration value="Weekend"/>
#     <xsd:enumeration value="All"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::DayType
  include VsscEnum
  
  set_enum_values "Sunday",
                  "Monday",
                  "Tuesday",
                  "Wednesday",
                  "Thursday",
                  "Friday",
                  "Saturday",
                  "Weekday",
                  "Weekend",
                  "All"
end
