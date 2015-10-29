class Vedastore::ContactInformation < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::ContactInformation
  
  belongs_to :contactable, polymorphic: true

  serialize :address_line, Array

  serialize :email, Array

  serialize :fax, Array
  
  serialize :phone, Array

  has_many :schedules, as: :schedulable
  
  serialize :uri, Array
    
end
