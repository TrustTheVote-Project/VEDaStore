# <xsd:simpleType name="ReportingUnitType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="BallotBatch"/>
#     <xsd:enumeration value="City"/>
#     <xsd:enumeration value="CityCouncil"/>
#     <xsd:enumeration value="CombinedPrecinct"/>
#     <xsd:enumeration value="Congressional"/>
#     <xsd:enumeration value="County"/>
#     <xsd:enumeration value="CountyCouncil"/>
#     <xsd:enumeration value="DropBox"/>
#     <xsd:enumeration value="Judicial"/>
#     <xsd:enumeration value="Municipality"/>
#     <xsd:enumeration value="National"/>
#     <xsd:enumeration value="PollingPlace"/>
#     <xsd:enumeration value="Precinct"/>
#     <xsd:enumeration value="School"/>
#     <xsd:enumeration value="Special"/>
#     <xsd:enumeration value="SplitPrecinct"/>
#     <xsd:enumeration value="State"/>
#     <xsd:enumeration value="StateHouse"/>
#     <xsd:enumeration value="StateSenate"/>
#     <xsd:enumeration value="Town"/>
#     <xsd:enumeration value="Township"/>
#     <xsd:enumeration value="Utility"/>
#     <xsd:enumeration value="Village"/>
#     <xsd:enumeration value="VoteCenter"/>
#     <xsd:enumeration value="Ward"/>
#     <xsd:enumeration value="Water"/>
#     <xsd:enumeration value="Other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::ReportingUnitType
  include VsscEnum
  
  set_enum_values "BallotBatch",
                  "City",
                  "CityCouncil",
                  "CombinedPrecinct",
                  "Congressional",
                  "County",
                  "CountyCouncil",
                  "DropBox",
                  "Judicial",
                  "Municipality",
                  "National",
                  "PollingPlace",
                  "Precinct",
                  "School",
                  "Special",
                  "SplitPrecinct",
                  "State",
                  "StateHouse",
                  "StateSenate",
                  "Town",
                  "Township",
                  "Utility",
                  "Village",
                  "VoteCenter",
                  "Ward",
                  "Water",
                  "Other"  
  
end 