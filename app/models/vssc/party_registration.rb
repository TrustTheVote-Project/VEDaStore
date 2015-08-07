# <xsd:complexType name="PartyRegistration">
#   <xsd:sequence>
#     <xsd:element name="PartyId" type="xsd:IDREF"/>
#   </xsd:sequence>
#   <xsd:attribute name="Count" type="xsd:integer" use="required"/>
# </xsd:complexType>
class Vssc::PartyRegistration < ActiveRecord::Base
  include VsscFunctions
  
  define_element("PartyId", method: :party_identifier)
  
  define_attribute("Count", required: true, type: Fixnum)
  
end
