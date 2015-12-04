class Vedastore::Candidate < ActiveRecord::Base
  include XsdRailsFunctions
    
  belongs_to :election
  has_one :external_identifier_collection, :as=>:identifiable
  include Vedaspace::Candidate
  
end
