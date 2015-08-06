# <xsd:complexType name="Hours">
#   <xsd:attribute name="Day" type="DayType"/>
#   <xsd:attribute name="EndTime" type="TimeWithZone" use="required"/>
#   <xsd:attribute name="StartTime" type="TimeWithZone" use="required"/>
# </xsd:complexType>
class Vssc::Hours < ActiveRecord::Base
  include VsscFunctions
  
  define_attribute("Day", type: Vssc::DayType, method: :day, required: true)
  define_attribute("EndTime", type: DateTime, method: :day, required: true)
  define_attribute("StartTime", type: DateTime, method: :day, required: true)
  
end
