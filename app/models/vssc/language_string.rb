# <xsd:complexType name="LanguageString">
#   <xsd:simpleContent>
#     <xsd:extension base="xsd:string">
#       <xsd:attribute name="Language" type="xsd:language" use="required"/>
#     </xsd:extension>
#   </xsd:simpleContent>
# </xsd:complexType>
class Vssc::LanguageString < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :internationalized_text
  
  define_attribute("Language") #type: "xsd:language"
  # inner text is actual value
end
