# <xsd:complexType name="SpatialExtent">
#   <xsd:sequence>
#     <xsd:element name="Coordinates" type="xsd:string"/>
#   </xsd:sequence>
#   <xsd:attribute name="Format" type="GeoSpatialFormat" use="required"/>
# </xsd:complexType>
class Vssc::SpatialExtent < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Coordinates")
  define_attribute("Format", required: true, type: Vssc::GeoSpatialFormat)
  
end
