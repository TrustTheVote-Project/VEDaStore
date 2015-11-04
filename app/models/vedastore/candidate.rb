class Vedastore::Candidate < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Candidate
    
  belongs_to :election
  has_one :external_identifier_collection, :as=>:identifiable
  
end
