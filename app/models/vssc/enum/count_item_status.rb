# <xsd:simpleType name="CountItemStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Completed"/>
#     <xsd:enumeration value="InProcess"/>
#     <xsd:enumeration value="NotProcessed"/>
#     <xsd:enumeration value="Unknown"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::CountItemStatus
  include VsscEnum
  
  set_enum_values "Completed",
                  "InProcess",
                  "NotProcessed",
                  "Unknown"
                  
end