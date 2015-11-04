class Vedastore::Contest < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Contest
  
  belongs_to :election
  
  has_many :ballot_selections, class_name: "Vedastore::BallotSelection", dependent: :destroy
  
  has_many :count_statuses, as: :count_statusable

  has_one :external_identifier_collection, :as=>:identifiable
  
  has_many :summary_counts, as: :summary_countable, class_name: "Vedastore::SummaryCount"
  
end
