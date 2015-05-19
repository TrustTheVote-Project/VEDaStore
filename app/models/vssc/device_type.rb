# <xsd:simpleType name="DeviceType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="electronic"/>
#     <xsd:enumeration value="lever"/>
#     <xsd:enumeration value="manual-count"/>
#     <xsd:enumeration value="mixed-systems"/>
#     <xsd:enumeration value="opscan-central"/>
#     <xsd:enumeration value="opscan-precinct"/>
#     <xsd:enumeration value="punch-card"/>
#     <xsd:enumeration value="unknown"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::DeviceType
  include Vssc::Enum
  
  set_enum_values "electronic",
                  "lever",
                  "manual-count",
                  "mixed-systems",
                  "opscan-central",
                  "opscan-precinct",
                  "punch-card",
                  "unknown"
  
end