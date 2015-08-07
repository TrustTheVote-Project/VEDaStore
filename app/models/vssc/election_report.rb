# <xsd:complexType name="ElectionReport">
#   <xsd:sequence>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="Election" type="Election" minOccurs="0"/>
#     <xsd:element name="GpUnitCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="GpUnit" type="GpUnit" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="Notes" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="OfficeCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Office" type="Office" minOccurs="1" maxOccurs="unbounded"/>
#           <xsd:element name="OfficeGroup" type="OfficeGroup" minOccurs="0" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="PartyCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Party" type="Party" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="PersonCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Person" type="Person" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element ref="ds:Signature" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="Format" type="ReportDetailLevel" use="required"/>
#   <xsd:attribute name="GeneratedDate" type="xsd:dateTime" use="required"/>
#   <xsd:attribute name="Issuer" type="xsd:string" use="required"/>
#   <xsd:attribute name="IssuerAbbreviation" type="xsd:string" use="required"/>
#   <xsd:attribute name="IsTest" type="xsd:boolean"/>
#   <xsd:attribute name="Sequence" type="xsd:integer" use="required"/>
#   <xsd:attribute name="SequenceEnd" type="xsd:integer" use="required"/>
#   <xsd:attribute name="Status" type="ResultsStatus" use="required"/>
#   <xsd:attribute name="TestType" type="xsd:string"/>
#   <xsd:attribute name="VendorApplicationId" type="xsd:string" use="required"/>
# </xsd:complexType>
require 'csv'
class Vssc::ElectionReport < ActiveRecord::Base
  
  include VsscFunctions
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("Message")
  define_element("Election", type: Vssc::Election, belongs_to: true)

  define_element("GpUnitCollection", type: Vssc::GpUnit, method: :gp_units, passthrough: "GpUnit")
  has_many :gp_units
  
  define_element("Notes")
  
  define_element("OfficeCollection", type: Vssc::Office, method: :offices, passthrough: "Office")
  has_many :office_collections
  has_many :offices
  # need Office / OfficeGroup

  
  define_element("PartyCollection", type: Vssc::Party, method: :parties, passthrough: "Party")
  has_many :parties


  define_element("PersonCollection", type: Vssc::Person, method: :people, passthrough: "Person")
  has_many :people
  
  
  
  
  define_attribute("Format", required: true, type: Vssc::Enum::ReportDetailLevel)
  define_attribute("GeneratedDate", required: true, type: "xsd:dateTime")
  define_attribute("Issuer", required: true)
  define_attribute("IssuerAbbreviation", required: true)
  define_attribute("IsTest", type: "xsd:boolean")
  define_attribute("Sequence", required: true, type: Fixnum)
  define_attribute("SequenceEnd", required: true, type: Fixnum)
  define_attribute("Status", required: true, type: Vssc::Enum::ResultsStatus)
  define_attribute("TestType")
  define_attribute("VendorApplicationId", required: true, method: :vendor_application_identifier)
  
  def xml_attributes_hash_with_root(node_name)
    attr_hash = xml_attributes_hash_without_root(node_name)
    attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
    attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/fake_url"
    attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/fake_url file:///G:/1622.2/ElectionResultsV29.xsd"
    return attr_hash
  end
  
  alias_method_chain :xml_attributes_hash, :root
  
end
