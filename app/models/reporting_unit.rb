class ReportingUnit < ActiveRecord::Base
  
  belongs_to :jurisdiction
  belongs_to :ocd_object
  has_and_belongs_to_many :districts
  
end
