class Vedastore::Party < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Party
  
  belongs_to :election_report
  
  has_one :external_identifier_collection, :as=>:identifiable
end
