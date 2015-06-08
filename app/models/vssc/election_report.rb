require 'csv'
class Vssc::ElectionReport < ActiveRecord::Base
  
  include VsscFunctions
  
  has_many :election_result_uploads
  
  has_one :election_report_upload, dependent: :destroy
  delegate :jurisdiction, to: :election_report_upload
  
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
  
  def parse_hart_dir(dest, source_id)
    Hart::Parser.parse(dest, self, source_id)
  end
  
  attr_reader :election_results_csv
  
  def election_results_csv=(file)
    eru = ElectionResultUpload.create(election_report: self, file: file)
    eru.process!
  end
  
  
  
  def self.from_jurisdiction(j)
    er = self.new
    er.object_id = "VSPubJurisdictionReport-#{j.id}-#{DateTime.now}"
    er.date = DateTime.now
    er.format = Vssc::ReportFormat.summary_contest
    er.status = Vssc::ReportFormat.pre_election
    er.issuer = "VSPub-#{j.name}"
    er.state_abbreviation = j.state_abbreviation
    er.vendor_application_id = "VSPub-<some-deployment-specific-guid>"
    
    j.districts.each do |d|
      district = Vssc::District.new
      district.district_type = d.vssc_type
      
      d.reporting_units.each do |ru|
        district.gp_sub_unit_refs << Vssc::GPSubUnitRef.new(object_id: ru.object_id)
      end
      
      district.object_id = d.object_id
      district.local_geo_code = d.internal_id
      district.name = d.name
      district.national_geo_code = d.ocd_id
      
      er.gp_units << district
    end
    
    j.reporting_units.each do |ru|
      reporting_unit = Vssc::ReportingUnit.new

      reporting_unit.object_id = ru.object_id
      reporting_unit.local_geo_code = ru.internal_id
      reporting_unit.name = ru.name
      reporting_unit.national_geo_code = ru.ocd_id
      
      reporting_unit.reporting_unit_type = Vssc::ReportingUnitType.precinct      
      
      er.gp_units << reporting_unit      
    end
    return er
  end
  
  def xml_attributes_hash_with_root(node_name)
    attr_hash = xml_attributes_hash_without_root(node_name)
    attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
    attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/fake_url"
    attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/fake_url file:///G:/1622.2/ElectionResultsV29.xsd"
    return attr_hash
  end
  
  alias_method_chain :xml_attributes_hash, :root
  
end
