# <xsd:complexType name="CountStatus">
#   <xsd:sequence>
#     <xsd:element name="Status" type="CountItemStatus"/>
#     <xsd:element name="Type" type="CountItemType"/>
#     <xsd:element name="OtherType" type="xsd:string" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>

class Vssc::CountStatus < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :count_statusable, polymorphic: true
  
  define_element("Status", type: Vssc::Enum::CountItemStatus)
  define_element("Type", type: Vssc::Enum::CountItemType, method: :count_item_type)
  define_element("OtherType")
  
end
