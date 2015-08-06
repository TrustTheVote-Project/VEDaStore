# <xsd:complexType name="Schedule">
#   <xsd:sequence>
#     <xsd:element name="Hours" type="Hours" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="EndDate" type="xsd:date"/>
#   <xsd:attribute name="IsOnlyByAppointment" type="xsd:boolean"/>
#   <xsd:attribute name="IsOrByAppointment" type="xsd:boolean"/>
#   <xsd:attribute name="IsSubjectToChange" type="xsd:boolean"/>
#   <xsd:attribute name="StartDate" type="xsd:date"/>
# </xsd:complexType>
class Vssc::Schedule < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Hours", type: Vssc::Hours, method: :hours)
  has_many :hours, as: :hourable
  
  define_attribute("EndDate", type: Date)
  define_attribute("StartDate", type: Date)
  define_attribute("IsOnlyByAppointment", type: "xsd:boolean")
  define_attribute("IsOrByAppointment", type: "xsd:boolean")
  define_attribute("IsSubjectToChange", type: "xsd:boolean")
  
end
