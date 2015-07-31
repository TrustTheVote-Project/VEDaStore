# <xsd:simpleType name="GeoSpatialFormat">
#   <xsd:restriction base="xsd:string">
#     <xsd:enumeration value="GeoJson"/>
#     <xsd:enumeration value="Gml"/>
#     <xsd:enumeration value="Kml"/>
#     <xsd:enumeration value="Shp"/>
#     <xsd:enumeration value="Wkt"/>
#   </xsd:restriction>
# </xsd:simpleType>
class Vssc::GeoSpatialFormat
  include VsscEnum
  
  set_enum_values "GeoJson",
                  "Gml",
                  "Kml",
                  "Shp",
                  "Wkt"
                  
end