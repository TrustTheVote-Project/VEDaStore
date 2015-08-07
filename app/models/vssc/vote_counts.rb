# <xsd:complexType name="VoteCounts">
#   <xsd:complexContent>
#     <xsd:extension base="Counts">
#       <xsd:attribute name="Count" type="xsd:float" use="required"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::VoteCounts < Vssc::Counts

  define_attribute("Count", type: Float, required: true)
  
end
