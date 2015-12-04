class Vedastore::Party < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :election_report
  
  has_one :external_identifier_collection, :as=>:identifiable
  include Vedaspace::Party

end
