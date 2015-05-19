class Vssc::GPUnit < ActiveRecord::Base
  include VsscFunctions
    
  has_many :reporting_unit_authority_refs
  
  has_and_belongs_to_many :election_reports
  
  define_element("GPSubUnit", type: "Vssc::GPUnit", method: :gp_sub_units)
  has_many :gp_sub_units, class_name: "Vssc::GPUnit", foreign_key: :gp_unit_id
  belongs_to :gp_unit, class_name: "Vssc::GPUnit"
  
  define_element("GPSubUnitRef", type: "Vssc::GPSubUnitRef", method: :gp_sub_unit_refs)
  has_many :gp_sub_unit_refs, :class_name=>"Vssc::GPSubUnitRef"
  has_many :gp_sub_unit_objects, through: :gp_sub_unit_refs,source: :gp_unit_ref
  
  define_element("GPUnitTotalCounts", type: Vssc::TotalCount, method: :total_counts)
  has_and_belongs_to_many :total_counts

  define_element("PartyRegistration", type: Vssc::PartyRegistration, method: :party_registration)
  belongs_to :party_registration

  define_element("SpatialDimension", type: Vssc::SpatialDimension, method: :spatial_dimensions)
  has_and_belongs_to_many :spatial_dimensions
  
  define_attribute("object_id", required: true)
  define_attribute("URL")
  define_attribute("localGeoCode")
  define_attribute("name")
  define_attribute("nationalGeoCode")
  define_attribute("stateGeoCode")


  def ocd_object
    @ocd_obj ||= OcdObject.find_by_ocd_id(self.national_geo_code)
  end
  
  def to_xml_node_with_shapes(xml = nil, node_name = nil)
    if self.national_geo_code && ocd_object
      shape = ocd_object.shapes.last
      shape_data = shape ? shape.shape_data : nil
      if shape_data
        return to_xml_node_without_shapes(xml, node_name) do |xml|
          xml.send("SpatialDimension") do |sd|
            sd.send("SpatialExtent") do |se|
              se.send("Coordinates") do |coo|
                coo.cdata(shape_data)
              end
            end
          end
        end
      end
    end
    return to_xml_node_without_shapes(xml, node_name)
  end
  
  alias_method_chain :to_xml_node, :shapes
  
  
  
end
