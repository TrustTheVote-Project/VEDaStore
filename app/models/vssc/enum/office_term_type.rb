# <xsd:simpleType name="OfficeTermType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="FullTerm"/>
#     <xsd:enumeration value="UnexpiredTerm"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::OfficeTermType
  include VsscEnum
  
  set_enum_values "FullTerm",
                  "UnexpiredTerm"
                  
end
