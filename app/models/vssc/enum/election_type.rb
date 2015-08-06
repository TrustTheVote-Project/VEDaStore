# <xsd:simpleType name="ElectionType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="General"/>
#     <xsd:enumeration value="PartisanPrimaryClosed"/>
#     <xsd:enumeration value="PartisanPrimaryOpen"/>
#     <xsd:enumeration value="Primary"/>
#     <xsd:enumeration value="Runoff"/>
#     <xsd:enumeration value="Special"/>
#     <xsd:enumeration value="Other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ElectionType
  include VsscEnum
  
  set_enum_values "General",
                  "Other",
                  "PartisanPrimaryClosed",
                  "PartisanPrimaryOpen",
                  "Primary",
                  "Runoff",
                  "Other"    
  
end