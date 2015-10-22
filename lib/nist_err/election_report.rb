module NistErr
  module ElectionReport
    extend ActiveSupport::Concern
    include XsdFunctions
    
    included do
    
      # TODO: Election should be multiple??
      define_element("Election", type: Vssc::Election, belongs_to: true)
  
      define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collection)
      # TODO: rails specific
      # has_one :external_identifier_collection, :as=>:identifiable
  
      define_element("Format", type: Vssc::Enum::ReportDetailLevel)
      define_element("GeneratedDate", type: "xsd:dateTime")

      define_element("GpUnitCollection", type: Vssc::GpUnit, method: :gp_units, passthrough: "GpUnit")
      # TODO: rails specific
      # has_many :gp_units, dependent: :destroy

      define_element("Issuer", required: true)
      define_element("IssuerAbbreviation", required: true)
      define_element("IsTest", type: "xsd:boolean")
      define_element("Notes")

      # need Office / OfficeGroup
      define_element("OfficeCollection", type: Vssc::Office, method: :offices, passthrough: "Office")
      # TODO: rails specific
      # has_many :office_groups, as: :office_groupable
      # has_many :offices, dependent: :destroy

      define_element("PartyCollection", type: Vssc::Party, method: :parties, passthrough: "Party")
      # TODO: rails specific
      # has_many :parties, dependent: :destroy
  
      define_element("PersonCollection", type: Vssc::Person, method: :people, passthrough: "Person")
      # TODO: rails specific
      # has_many :people, dependent: :destroy
  
      define_element("SequenceStart", type: Fixnum)
      define_element("SequenceEnd", type: Fixnum)
      define_element("Status", type: Vssc::Enum::ResultsStatus)
      define_element("TestType")
      define_element("VendorApplicationId", method: :vendor_application_identifier)
    end
    
    def xml_attributes_hash_with_root(node_name)
      attr_hash = xml_attributes_hash_without_root(node_name)
      attr_hash['xmlns:xsi'] = "http://www.w3.org/2001/XMLSchema-instance"
      attr_hash['xmlns'] = "http://grouper.ieee.org/groups/1622/groups/2/V1/1622_2-election_results_reporting.xsd"
      attr_hash['xsi:schemaLocation'] = "http://grouper.ieee.org/groups/1622/groups/2/V1/1622_2-election_results_reporting.xsd http://grouper.ieee.org/groups/1622/groups/2/V1/1622_2-election_results_reporting.xsd"
      return attr_hash
    end
  
    #alias_method_chain :xml_attributes_hash, :root
  
    
  end
end