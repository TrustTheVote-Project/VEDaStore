require 'spec_helper'

RSpec.describe Vssc::ElectionReport, type: :model do
  # let(:e) { Vssc::ElectionReport.new }
  # before(:each) do
  #   e.object_id = "oid"
  #   e.date = DateTime.now.iso8601
  #   #e.format = Vssc::ReportFormat.precinct_level
  #   #e.status = Vssc::ReportStatus.test
  #   e.issuer = "issuer"
  #   e.sequence = 1
  #   e.sequence_end = 5
  #   e.state_abbreviation = "ma"
  #   e.vendor_application_id = "ID"
  # end
  # subject { e }
    #
  # it { should have_element("Message") }
  # it { should have_element("GPUnitCollection") }
  # it { should validate_element_type("GPUnitCollection", VSSC::GPUnitCollection.new) }
  # it { should have_element("PartyCollection") }
  # it { should validate_element_type("PartyCollection", VSSC::PartyCollection.new) }
  # it { should have_element("PersonCollection") }
  # it { should validate_element_type("PersonCollection", VSSC::PersonCollection.new) }
  # it { should have_element("OfficeCollection") }
  # it { should validate_element_type("OfficeCollection", VSSC::OfficeCollection.new) }
  # it { should have_element_array("Election") }
  # it { should validate_element_array_type("Election", VSSC::Election.new) }
  #
  # it { should have_attribute("object_id") }
  # it { should validate_presence_of_attribute("object_id") }
  # it { should have_attribute("date") }
  # it { should validate_presence_of_attribute("date") }
  # it { should validate_attribute_type("date", DateTime.now.iso8601) }
  # it { should have_attribute("format") }
  # it { should validate_presence_of_attribute("format") }
  # it { should validate_attribute_type("format", VSSC::ReportFormat.precinct_level) }
  # it { should have_attribute("status") }
  # it { should validate_presence_of_attribute("status") }
  # it { should validate_attribute_type("status", VSSC::ReportStatus.test) }
  # it { should have_attribute("issuer") }
  # it { should validate_presence_of_attribute("issuer") }
  # it { should have_attribute("sequence") }
  # it { should validate_presence_of_attribute("sequence") }
  # it { should validate_attribute_type("sequence", 1)}
  # it { should have_attribute("sequenceEnd") }
  # it { should validate_presence_of_attribute("sequenceEnd") }
  # it { should validate_attribute_type("sequenceEnd", 1)}
  # it { should have_attribute("stateAbbreviation") }
  # it { should validate_presence_of_attribute("stateAbbreviation") }
  # it { should have_attribute("stateCode") }
  # it { should have_attribute("vendorApplicationID") }
  # it { should validate_presence_of_attribute("vendorApplicationID") }
  
  
  describe 'XML import/export' do
    it "should import/export equivalent files" do
      #xml_file = './spec/fixtures/NY_1622-2015S3V1_Results201504081115-0511151006.xml'
      xml_file = './spec/fixtures/NY_TEST.xml'
      doc = nil
      e = nil
      File.open(xml_file) do |f|
        doc = Nokogiri::XML(f)
      end
      File.open(xml_file) do |f|
        e = Vssc::ElectionReport.parse_vssc_file(f)
        e.save!
      end
      
      e = Vssc::ElectionReport.last
      
      eq = EquivalentXml.equivalent?(e.to_xml_node.doc.root, doc.root, opts = { :element_order => false, :normalize_whitespace => true }) do |a,b, result|
        # if result==false
        #   puts a
        #   puts b
        # end
        # result
      end
      expect(eq).to be(true)
      
      #expect(e.to_xml_node.doc.root).to be_equivalent_to(doc.root)
    end
  end
  
  
  
end
