# <xsd:complexType name="Counts" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="Device" type="Device" minOccurs="0"/>
#     <xsd:element name="GpUnitId" type="xsd:IDREF" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="OtherType" type="xsd:string"/>
#   <xsd:attribute name="Type" type="CountItemType"/>
# </xsd:complexType>
class Vssc::Counts < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :countable, polymorphic: true
  
  
  define_element("Device", type: Vssc::Device, belongs_to: true)
  
  define_element("GpUnitId", method: :gp_unit_identifier)
  
  define_attribute("OtherType")
  define_attribute("Type", type: Vssc::Enum::CountItemType, method: :count_item_type)
  
end
