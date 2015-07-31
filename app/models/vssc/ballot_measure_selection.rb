# <xsd:complexType name="BallotMeasureSelection">
#   <xsd:complexContent>
#     <xsd:extension base="BallotSelection">
#       <xsd:sequence>
#         <xsd:element name="Selection" type="InternationalizedText"/>
#       </xsd:sequence>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::BallotMeasureSelection < Vssc::BallotSelection
  define_attribute("Selection", {:required=>true})
  
  def name
    selection
  end
  
end
