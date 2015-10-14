# <xsd:complexType name="BallotMeasureContest">
#   <xsd:complexContent>
#     <xsd:extension base="Contest">
#       <xsd:sequence>
#         <xsd:element name="ConStatement" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="EffectOfAbstain" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="FullText" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="InfoUri" type="xsd:anyURI" minOccurs="0"/>
#         <xsd:element name="PassageThreshold" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="ProStatement" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="SummaryText" type="InternationalizedText" minOccurs="0"/>
#         <xsd:element name="Type" type="BallotMeasureType" minOccurs="0"/>
#         <xsd:element name="OtherType" type="xsd:string" minOccurs="0"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::BallotMeasureContest < Vssc::Contest
  define_element "ConStatement", type: Vssc::InternationalizedText, belongs_to: true
  
  define_element "EffectOfAbstain", type: Vssc::InternationalizedText, belongs_to: true
  define_element "FullText", type: Vssc::InternationalizedText, belongs_to: true
  define_element "InfoUri"
  define_element "PassageThreshold", type: Vssc::InternationalizedText, belongs_to: true
  define_element "ProStatement", type: Vssc::InternationalizedText, belongs_to: true
  define_element "SummaryText", type: Vssc::InternationalizedText, belongs_to: true
  
  define_element "Type", type: Vssc::Enum::BallotMeasureType, method: :ballot_measure_type, required: true
  define_element "OtherType"
  
end
