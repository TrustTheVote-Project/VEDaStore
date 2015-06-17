# <xsd:simpleType name="ElectionType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="general"/>
#     <xsd:enumeration value="other"/>
#     <xsd:enumeration value="partisan-primary-closed"/>
#     <xsd:enumeration value="partisan-primary-open"/>
#     <xsd:enumeration value="primary"/>
#     <xsd:enumeration value="runoff"/>
#     <xsd:enumeration value="special"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ElectionType
  include VsscEnum
  
  set_enum_values "general",
                  "other",
                  "partisan-primary-closed",
                  "partisan-primary-open",
                  "primary",
                  "runoff",
                  "special"    
  
end