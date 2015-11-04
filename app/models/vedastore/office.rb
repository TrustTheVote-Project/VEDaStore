class Vedastore::Office < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Office
  
  belongs_to :office_group
  belongs_to :election_report
  
  has_one :external_identifier_collection, :as=>:identifiable
  
  has_many :office_office_holder_id_refs
  has_many :office_holders, through: :office_office_holder_id_refs
    
end
