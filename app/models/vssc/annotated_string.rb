# <xsd:complexType name="AnnotatedString">
#   <xsd:simpleContent>
#     <xsd:extension base="xsd:string">
#       <xsd:attribute name="annotation" type="ShortString"/>
#     </xsd:extension>
#   </xsd:simpleContent>
# </xsd:complexType>
class Vssc::AnnotatedString < ActiveRecord::Base
  include VsscFunctions
  
  define_text_node("value")
  define_attribute("annotation")
  
  
end
