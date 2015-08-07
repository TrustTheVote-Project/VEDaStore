# <xsd:complexType name="CountStatus">
#   <xsd:attribute name="OtherType" type="xsd:string"/>
#   <xsd:attribute name="Status" type="CountItemStatus" use="required"/>
#   <xsd:attribute name="Type" type="CountItemType" use="required"/>
# </xsd:complexType>
class Vssc::CountStatus < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :count_statusable, polymorphic: true
  
  define_attribute("OtherType")
  define_attribute("Status", type: Vssc::Enum::CountItemStatus, required: true)
  define_attribute("Type", type: Vssc::Enum::CountItemType, method: :count_item_type, required: true)
  
end
