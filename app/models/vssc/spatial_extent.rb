class Vssc::SpatialExtent < ActiveRecord::Base
  include VsscFunctions
  belongs_to :spatial_dimension
  
  define_element("Coordinates")
  define_attribute("object_id", required: true)
  define_attribute("format", required: true)
  
end
