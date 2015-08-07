# <xsd:complexType name="SummaryCounts">
#   <xsd:complexContent>
#     <xsd:extension base="Counts">
#       <xsd:attribute name="BallotsCast" type="xsd:integer"/>
#       <xsd:attribute name="BallotsOutstanding" type="xsd:integer"/>
#       <xsd:attribute name="BallotsRejected" type="xsd:integer"/>
#       <xsd:attribute name="Overvotes" type="xsd:integer"/>
#       <xsd:attribute name="Undervotes" type="xsd:integer"/>
#       <xsd:attribute name="WriteIns" type="xsd:integer"/>
#     </xsd:extension>
#   </xsd:complexContent>
# </xsd:complexType>
class Vssc::SummaryCounts < Vssc::Counts
  
  define_attribute("BallotsCast", type: Fixnum)
  define_attribute("BallotsOutstanding", type: Fixnum)
  define_attribute("BallotsRejected", type: Fixnum)
  define_attribute("Overvotes", type: Fixnum)
  define_attribute("Undervotes", type: Fixnum)
  define_attribute("WriteIns", type: Fixnum)
  
end
