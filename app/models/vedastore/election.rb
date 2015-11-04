class Vedastore::Election < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Election
  
  has_many :ballot_styles, dependent: :destroy
  has_many :candidates, dependent: :destroy
  has_many :contests, dependent: :destroy

  has_many :count_statuses, as: :count_statusable
  
  has_one :external_identifier_collection, :as=>:identifiable
    
end