class Vssc::Candidate < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Party")
  define_element("Person")
  
  define_element("Office", type: String, method: :offices)
  has_many :candidate_office_refs
  has_many :offices, through: :candidate_office_refs
  
  
  
  define_attribute("object_id", required: true)
  define_attribute("ballotName", required: true)
  define_attribute("candidateID")
  define_attribute("fileDate", type: "xsd:dateTime")  
  define_attribute("isIncumbent", type: "xsd:boolean")  
  define_attribute("isTopTicket", type: "xsd:boolean")  
  define_attribute("sequenceOrder", type: Fixnum)  
  define_attribute("status", type: Vssc::CandidateStatus)
  
end
