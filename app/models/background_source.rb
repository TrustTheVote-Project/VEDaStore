class BackgroundSource < ActiveRecord::Base
  
  has_many :districts
  has_many :reporting_units
  belongs_to :jurisdiction
  
end
