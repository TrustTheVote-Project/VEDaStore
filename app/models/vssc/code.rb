# <xsd:complexType name="Code">
#   <xsd:attribute name="OtherType" type="xsd:string"/>
#   <xsd:attribute name="Type" type="CodeType" use="required"/>
#   <xsd:attribute name="Value" type="xsd:string" use="required"/>
# </xsd:complexType>
class Vssc::Code < ActiveRecord::Base
  
  define_attribute("OtherType")  
  define_attribute("Type", type: Vssc::CodeType, method: :code_type, required:true)
  define_attribute("Value", required: true)
  
end
