# <xsd:complexType name="InternationalizedText">
#   <xsd:sequence>
#     <xsd:element name="Text" type="LanguageString" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="label" type="xsd:string"/>
# </xsd:complexType>

class Vssc::InternationalizedText < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Text", type: Vssc::LanguageString, method: :language_strings)
  has_many :language_strings
  
  define_attribute("label")
  
end
