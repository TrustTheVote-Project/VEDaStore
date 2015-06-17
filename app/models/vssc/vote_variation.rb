# <xsd:simpleType name="VoteVariation">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="approval"/>
#     <xsd:enumeration value="cumulative"/>
#     <xsd:enumeration value="IRV"/>
#     <xsd:enumeration value="N-of-M"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::VoteVariation
  include VsscEnum

  set_enum_values "approval",
                  "cumulative",
                  "IRV",
                  "N-of-M"
    
end