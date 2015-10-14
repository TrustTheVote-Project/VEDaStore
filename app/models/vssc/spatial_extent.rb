# <xsd:complexType name="SpatialExtent">
#   <xsd:sequence>
#     <xsd:element name="Coordinates" type="xsd:string"/>
#     <xsd:element name="Format" type="GeoSpatialFormat"/>
#   </xsd:sequence>
# </xsd:complexType>

class Vssc::SpatialExtent < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Coordinates")
  define_element("Format", required: true, type: Vssc::Enum::GeoSpatialFormat)
  
end
