# <xsd:complexType name="VoteCounts">
#   <xsd:complexContent>
#     <xsd:extension base="Counts">
#       <xsd:sequence>
#         <xsd:element name="Count" type="xsd:float"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>

class Vssc::VoteCounts < Vssc::Counts

  define_element("Count", type: Float, required: true)
  
end
