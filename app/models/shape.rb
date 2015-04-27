class Shape < ActiveRecord::Base
  
  belongs_to :ocd_object
  belongs_to :shape_source
  
end
