# <xsd:simpleType name="EthnicityType">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="asian"/>
#     <xsd:enumeration value="black"/>
#     <xsd:enumeration value="hispanic"/>
#     <xsd:enumeration value="moreThanOne"/>
#     <xsd:enumeration value="nativeAmerican"/>
#     <xsd:enumeration value="white"/>
#     <xsd:enumeration value="unknown"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::EthnicityType
  include Vssc::Enum
  
  set_enum_values "asian",
                  "black",
                  "hispanic",
                  "moreThanOne",
                  "nativeAmerican",
                  "white",
                  "unknown"  
  
end