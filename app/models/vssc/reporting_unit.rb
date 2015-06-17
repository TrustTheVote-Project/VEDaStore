class Vssc::ReportingUnit < Vssc::GPUnit
  define_element("Authority", type: String, method: :reporting_unit_authority_refs)
  #TODO should Authority be it's own class?
  # has_many :authorities, through: :reporting_unit_authority_refs
  
  define_element("ReportingUnitContact", type: Vssc::Contact, method: :contacts)
  # has_and_belongs_to_many :contacts
  
  define_attribute("reportingUnitType", type: Vssc::ReportingUnitType, required: true)
  define_attribute("hasReported", type: "xsd:boolean")
  define_attribute("registeredVoters", type: Fixnum)
  define_attribute("reportedPrecincts", type: Fixnum)
  define_attribute("totalParticipatingVoters", type: Fixnum)
  define_attribute("totalPrecincts", type: Fixnum)
  
end
