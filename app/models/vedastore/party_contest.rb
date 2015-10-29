# <xsd:complexType name="PartyContest">
#   <xsd:complexContent>
#     <xsd:extension base="Contest"/>
#   </xsd:complexContent>
# </xsd:complexType>
class Vedastore::PartyContest < Vssc::Contest
  include XsdRailsFunctions
  include Vedaspace::PartyContest
  
end
