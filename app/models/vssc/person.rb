class Vssc::Person < ActiveRecord::Base
  include VsscFunctions
  
  has_and_belongs_to_many :election_reports

  define_element("Party" )
  #has_one :party_ref - via Party string object_id
  
  define_element("Contact", :type=>Vssc::Contact, method: :contacts)
  has_and_belongs_to_many :contacts
  
  
  define_attribute("object_id", required: true)
  #define_attribute("ethnicity", type: EthnicityType)
  define_attribute("firstName")
  #define_attribute("gender", type: GenderType)
  define_attribute("lastName", required: true)
  define_attribute("middleName")
  define_attribute("prefix")
  define_attribute("profession")
  define_attribute("nickname")
  define_attribute("title")
  define_attribute("suffix")
  
  
end
