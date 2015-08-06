# <xsd:simpleType name="ReportDetailLevel">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="PrecinctLevel"/>
#     <xsd:enumeration value="SummaryContest"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ReportDetailLevel
  include VsscEnum
  
  set_enum_values "PrecinctLevel",
                  "SummaryContest"
                  
                  
end

