# <xsd:simpleType name="ReportFormat">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="precinct-level"/>
#     <xsd:enumeration value="summary-contest"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ReportFormat
  include Vssc::Enum
  
  set_enum_values "precinct-level",
                  "summary-contest"    
  
end