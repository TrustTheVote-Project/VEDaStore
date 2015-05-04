# <xsd:simpleType name="GenderType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="female"/>
#     <xsd:enumeration value="male"/>
#     <xsd:enumeration value="unknown"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::GenderType
  include Vssc::Enum
  
  set_enum_values "female",
                  "male",
                  "unknown"  
  
end
