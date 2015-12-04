class Vedastore::ContactInformation < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :contactable, polymorphic: true

  serialize :address_line, Array

  serialize :email, Array

  serialize :fax, Array
  
  serialize :phone, Array

  has_many :schedules, as: :schedulable
  
  include Vedaspace::ContactInformation

  serialize :uri, Array
    
end
