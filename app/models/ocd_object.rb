class OcdObject < ActiveRecord::Base
  
  has_many :districs
  has_many :reporting_units
  has_many :shapes
  
end
