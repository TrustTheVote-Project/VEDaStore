class District < ActiveRecord::Base
  
  belongs_to :jursidiction

  belongs_to :ocd_object
  
  has_and_belongs_to_many :reporting_units
  
end
