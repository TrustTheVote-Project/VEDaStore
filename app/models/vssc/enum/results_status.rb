# <xsd:simpleType name="ResultsStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="Certified"/>
#     <xsd:enumeration value="Correction"/>
#     <xsd:enumeration value="PreElection"/>
#     <xsd:enumeration value="Recount"/>
#     <xsd:enumeration value="UnofficialComplete"/>
#     <xsd:enumeration value="UnofficialPartial"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::ResultsStatus
  include VsscEnum
  
  set_enum_values "Certified",
                  "Correction",
                  "PreElection",
                  "Recount",
                  "UnofficialComplete",
                  "UnofficialPartial"
                  
end

