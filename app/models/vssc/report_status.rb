# <xsd:simpleType name="ReportStatus">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="certified"/>
#     <xsd:enumeration value="correction"/>
#     <xsd:enumeration value="pre-election"/>
#     <xsd:enumeration value="recount"/>
#     <xsd:enumeration value="test"/>
#     <xsd:enumeration value="unofficial-complete"/>
#     <xsd:enumeration value="unofficial-partial"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ReportStatus
  include VsscEnum
  
  set_enum_values  "certified",
                   "correction",
                   "pre-election",
                   "recount",
                   "test",
                   "unofficial-complete",
                   "unofficial-partial"
  
  
end 