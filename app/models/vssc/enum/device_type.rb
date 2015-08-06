# <xsd:simpleType name="DeviceType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Electronic"/>
#     <xsd:enumeration value="Lever"/>
#     <xsd:enumeration value="ManualCount"/>
#     <xsd:enumeration value="MixedSystems"/>
#     <xsd:enumeration value="OpscanCentral"/>
#     <xsd:enumeration value="OpscanPrecinct"/>
#     <xsd:enumeration value="PunchCard"/>
#     <xsd:enumeration value="Unknown"/>
#     <xsd:enumeration value="Other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::DeviceType
  include VsscEnum
  
  set_enum_values "Electronic",
                  "Lever",
                  "ManualCount",
                  "MixedSystems",
                  "OpscanCentral",
                  "OpscanPrecinct",
                  "PunchCard",
                  "Unknown",
                  "Other"
end               