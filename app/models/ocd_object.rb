class OcdObject < ActiveRecord::Base
  
  has_many :disctrics
  has_many :reporting_units
  has_many :shapes
  
end
