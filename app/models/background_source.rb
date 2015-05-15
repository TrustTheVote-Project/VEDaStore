class BackgroundSource < ActiveRecord::Base
  
  has_many :districts, dependent: :destroy
  has_many :reporting_units, dependent: :destroy
  belongs_to :jurisdiction
  
end
