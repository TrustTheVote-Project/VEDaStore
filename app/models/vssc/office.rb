class Vssc::Office < ActiveRecord::Base
  include VsscFunctions
  
  has_and_belongs_to_many :election_reports
  
  define_element("OfficeGPScope", type: String, method: :office_gp_scope)
  
  define_attribute("object_id", required: true)
  define_attribute("name", required: true)
  define_attribute("filingDate", type: "xsd:dateTime")
  define_attribute("incumbentRunning", type: "xsd:boolean")
  define_attribute("localOfficeCode")
  define_attribute("nationalOfficeCode")
  define_attribute("stateOfficeCode")
  define_attribute("partisan", type: "xsd:boolean")
  define_attribute("termStartDate", type: "xsd:date")
  define_attribute("termEndDate", type: "xsd:date")
  define_attribute("unexpiredTerm", type: "xsd:boolean")
  
  
end
