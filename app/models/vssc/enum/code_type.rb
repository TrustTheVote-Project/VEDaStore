# <xsd:simpleType name="CodeType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Fips"/>
#     <xsd:enumeration value="LocalLevel"/>
#     <xsd:enumeration value="NationalLevel"/>
#     <xsd:enumeration value="OcdId"/>
#     <xsd:enumeration value="Other"/>
#     <xsd:enumeration value="StateLevel"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::CodeType
  include VsscEnum
  
  set_enum_values "Fips",
                  "LocalLevel",
                  "NationalLevel",
                  "OcdId",
                  "Other",
                  "StateLevel"
                  
end