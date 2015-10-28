# <xsd:complexType name="PartyRegistration">
#   <xsd:sequence>
#     <xsd:element name="Count" type="xsd:integer"/>
#     <xsd:element name="PartyId" type="xsd:IDREF"/>
#   </xsd:sequence>
# </xsd:complexType>


class Vssc::PartyRegistration < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Count", required: true, type: Fixnum)
  define_element("PartyId", method: :party_identifier)  
  
end
