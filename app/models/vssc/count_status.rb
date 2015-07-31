# <xsd:complexType name="CountStatus">
#   <xsd:attribute name="OtherType" type="xsd:string"/>
#   <xsd:attribute name="Status" type="CountItemStatus" use="required"/>
#   <xsd:attribute name="Type" type="CountItemType" use="required"/>
# </xsd:complexType>
class Vssc::CountStatus < ActiveRecord::Base
  
  define_attribute("OtherType")
  define_attribute("Status", type: Vssc::CountItemStatus, required: true)
  define_attrubute("Type", type: Vssc::CountItemType, method: :count_item_type, required: true)
  
end
