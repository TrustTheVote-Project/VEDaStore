# <xsd:complexType name="OfficeGroup">
#   <xsd:sequence>
#     <xsd:element name="OfficeId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="SubOfficeGroup" type="OfficeGroup" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="Name" type="xsd:string" use="required"/>
# </xsd:complexType>
class Vssc::OfficeGroup < ActiveRecord::Base
  include VsscFunctions
  
  define_element("OfficeId", type: String, method: :office_group_office_id_refs)
  has_many :office_group_office_id_refs
  has_many :offices, through: :office_group_office_id_refs
  
  define_element("SubOfficeGroup", type: Vssc::OfficeGroup, method: :office_groups)
  has_many :office_groups, as: :office_groupable
  
  belongs_to :office_groupable, polymorphic: true
  
  define_attribute("Name", required: true)
  
end
