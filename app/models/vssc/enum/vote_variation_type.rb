# <xsd:simpleType name="VoteVariationType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="1ofM"/>
#     <xsd:enumeration value="Approval"/>
#     <xsd:enumeration value="Borda"/>
#     <xsd:enumeration value="Cumulative"/>
#     <xsd:enumeration value="Majority"/>
#     <xsd:enumeration value="NofM"/>
#     <xsd:enumeration value="Plurality"/>
#     <xsd:enumeration value="Proportional"/>
#     <xsd:enumeration value="Range"/>
#     <xsd:enumeration value="Rcv"/>
#     <xsd:enumeration value="SuperMajority"/>
#     <xsd:enumeration value="Other"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::Enum::VoteVariationType
  include VsscEnum

  set_enum_values "1ofM",
                  "Approval",
                  "Borda",
                  "Cumulative",
                  "Majority",
                  "NofM",
                  "Plurality",
                  "Proportional",
                  "Range",
                  "Rcv",
                  "SuperMajority",
                  "Other"
                                    
end