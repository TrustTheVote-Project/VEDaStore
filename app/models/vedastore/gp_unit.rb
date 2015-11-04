class Vedastore::GpUnit < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::GpUnit
  
  belongs_to :election_report
    
  has_many :gp_unit_composing_gp_unit_id_refs
  has_many :composing_gp_units, through: :gp_unit_composing_gp_unit_id_refs

  has_one :external_identifier_collection, :as=>:identifiable
  
  has_many :summary_counts, as: :summary_countable, class_name: "Vedastore::SummaryCount"
  
end
