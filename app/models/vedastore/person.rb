class Vedastore::Person < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Person

  belongs_to :election_report
  
  has_many :contact_informations, as: :contactable

  serialize :middle_names, Array

end
