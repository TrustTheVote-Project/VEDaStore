class Vssc::SpatialDimension < ActiveRecord::Base
  include VsscFunctions
  
  define_element("SpatialExtent", type: Vssc::SpatialExtent)
  has_one :spatial_extent
  
  define_attribute("object_id", required: true)
  define_attribute("map")
  
  
end
