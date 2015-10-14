# <xsd:complexType name="SpatialDimension">
#   <xsd:sequence>
#     <xsd:element name="MapUri" type="xsd:anyURI" minOccurs="0"/>
#     <xsd:element name="SpatialExtent" type="SpatialExtent" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>

class Vssc::SpatialDimension < ActiveRecord::Base
  include VsscFunctions
  
  define_element("MapUri")
  define_element("SpatialExtent", type: Vssc::SpatialExtent, belongs_to: true)  
  
end
