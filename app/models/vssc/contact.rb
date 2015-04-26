class Vssc::Contact < ActiveRecord::Base
  include VsscFunctions
  has_and_belongs_to_many :people
  has_and_belongs_to_many :reporting_units
  
  define_attribute("object_id", required: true)
  define_attribute("URL")
  define_attribute("addressNumber")
  define_attribute("city")
  define_attribute("country")
  define_attribute("email")
  define_attribute("fax")
  define_attribute("hours")
  define_attribute("name")
  define_attribute("phone")
  define_attribute("postalCode")
  define_attribute("stateAbbreviation")
  define_attribute("streetName")  
    
end
