# <xsd:complexType name="ContactInformation">
#   <xsd:sequence>
#     <xsd:element name="AddressLine" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Email" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Fax" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Name" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="Phone" type="xsd:string" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Schedule" type="Schedule" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Uri" type="xsd:anyURI" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
# </xsd:complexType>
class Vssc::ContactInformation < ActiveRecord::Base
  include VsscFunctions

  define_element("AddressLine")
  serialize :address_line, Array
  define_element("Email")
  serialize :email, Array
  define_element("Fax")
  serialize :fax, Array
  define_element("Name")
  define_element("Phone")
  serialize :phone, Array

  define_element("Schedule", type: Vssc::Schedule, method: :schedules)
  has_many :schedules
  
  define_element("Uri")
  serialize :uri, Array
  
    
end
