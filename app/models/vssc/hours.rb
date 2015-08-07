# <xsd:complexType name="Hours">
#   <xsd:attribute name="Day" type="DayType"/>
#   <xsd:attribute name="EndTime" type="TimeWithZone" use="required"/>
#   <xsd:attribute name="StartTime" type="TimeWithZone" use="required"/>
# </xsd:complexType>
class Vssc::Hours < ActiveRecord::Base
  include VsscFunctions

  belongs_to :hourable, polymorphic: true
  
  define_attribute("Day", type: Vssc::Enum::DayType, required: true)
  define_attribute("EndTime", type: DateTime, required: true)
  define_attribute("StartTime", type: DateTime, required: true)
  
end
