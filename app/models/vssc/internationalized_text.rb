# <xsd:complexType name="InternationalizedText">
#   <xsd:sequence>
#     <xsd:element name="LanguageString" type="LanguageString" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="Identifier" type="xsd:string"/>
# </xsd:complexType>
class Vssc::InternationalizedText < ActiveRecord::Base
  include VsscFunctions
  
  define_element("LanguageString", type: Vssc::LanguageString, method: :language_strings)
  define_attribute("Identifier")
  
end
