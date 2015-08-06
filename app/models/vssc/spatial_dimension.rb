# <xsd:complexType name="SpatialDimension">
#   <xsd:sequence>
#     <xsd:element name="SpatialExtent" type="SpatialExtent" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="MapUri" type="xsd:anyURI"/>
# </xsd:complexType>
class Vssc::SpatialDimension < ActiveRecord::Base
  include VsscFunctions
  
  define_element("SpatialExtent", type: Vssc::SpatialExtent, belongs_to: true)

  define_attribute("map_uri")
  
  
end
