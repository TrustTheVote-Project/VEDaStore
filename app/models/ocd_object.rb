class OcdObject < ActiveRecord::Base
  
  has_many :districts
  has_many :reporting_units
  has_many :shapes
  
end
