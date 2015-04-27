class Vssc::ElectionReport < ActiveRecord::Base
  
  include VsscFunctions
  
  define_element("Message")
  define_element("GPUnitCollection", type: Vssc::GPUnit, method: :gp_units, passthrough: "GPUnit")
  has_and_belongs_to_many :gp_units, :class_name=>"Vssc::GPUnit"
  
  define_element("PartyCollection", type: Vssc::Party, method: :parties, passthrough: "Party")
  has_and_belongs_to_many :parties
  define_element("PersonCollection", type: Vssc::Person, method: :people, passthrough: "Person")
  has_and_belongs_to_many :people
  define_element("OfficeCollection", type: Vssc::Office, method: :offices, passthrough: "Office")
  has_and_belongs_to_many :offices
  
  
  define_element("Election", method: :elections, type: Vssc::Election)
  has_many :elections
  
  
  define_attribute("object_id", required: true)
  define_attribute("date", required: true, type: "xsd:dateTime")
  define_attribute("format", required: true, type: Vssc::ReportFormat)
  define_attribute("status", required: true, type: Vssc::ReportStatus)
  define_attribute("issuer", required: true)
  define_attribute("sequence", required: true, type: Fixnum)
  define_attribute("sequenceEnd", required: true, type: Fixnum)
  define_attribute("stateAbbreviation", required: true)
  define_attribute("stateCode")
  define_attribute("vendorApplicationID", required: true)
  
  
  def xml_attributes_hash_with_root(node_name)
    attr_hash = xml_attributes_hash_without_root(node_name)
    attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
    attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/fake_url"
    attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/fake_url file:///G:/1622.2/ElectionResultsV29.xsd"
    return attr_hash
  end
  
  alias_method_chain :xml_attributes_hash, :root
  
end
