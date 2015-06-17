# <xsd:simpleType name="ReportingUnitType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="audit-batch"/>
#     <xsd:enumeration value="city"/>
#     <xsd:enumeration value="combined-precinct"/>
#     <xsd:enumeration value="county"/>
#     <xsd:enumeration value="jurisdiction"/>
#     <xsd:enumeration value="municipality"/>
#     <xsd:enumeration value="other"/>
#     <xsd:enumeration value="polling-place"/>
#     <xsd:enumeration value="precinct"/>
#     <xsd:enumeration value="split-precinct"/>
#     <xsd:enumeration value="state"/>
#     <xsd:enumeration value="township"/>
#     <xsd:enumeration value="vote-center"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ReportingUnitType
  include VsscEnum
  
  set_enum_values "audit-batch",
                  "city",
                  "combined-precinct",
                  "county",
                  "jurisdiction",
                  "municipality",
                  "other",
                  "polling-place",
                  "precinct",
                  "split-precinct",
                  "state",
                  "township",
                  "vote-center"    
  
end 