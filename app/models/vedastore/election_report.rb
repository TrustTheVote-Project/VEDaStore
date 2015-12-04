class Vedastore::ElectionReport < ActiveRecord::Base
  include XsdRailsFunctions
  
  has_one :external_identifier_collection, :as=>:identifiable
  has_many :gp_units, dependent: :destroy
  has_many :office_groups, as: :office_groupable
  has_many :offices, dependent: :destroy
  has_many :parties, dependent: :destroy
  has_many :people, dependent: :destroy
  
  include Vedaspace::ElectionReport
  
end
