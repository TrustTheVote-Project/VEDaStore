# <xsd:complexType name="PartyContest">
#   <xsd:complexContent>
#     <xsd:extension base="Contest"/>
#   </xsd:complexContent>
# </xsd:complexType>
class Vedastore::PartyContest < Vedastore::Contest
  include XsdRailsFunctions
  include Vedaspace::PartyContest
  
end
