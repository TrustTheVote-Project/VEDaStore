class Vssc::GpUnit < ActiveRecord::Base
  include VsscFunctions
  
  
  has_many :reporting_unit_authority_refs
  
  has_and_belongs_to_many :election_reports
  
  define_element("GPSubUnit", type: "Vssc::GpUnit", method: :gp_sub_units)
  has_many :gp_sub_units, class_name: "Vssc::GpUnit", foreign_key: :gp_unit_id
  belongs_to :gp_unit
  
  define_element("GPSubUnitRef", type: "Vssc::GpSubUnitRef", method: :gp_sub_unit_refs)
  has_many :gp_sub_unit_refs
  has_many :gp_sub_unit_objects, through: :gp_sub_unit_refs,source: :gp_unit_ref
  
  define_element("GPUnitTotalCounts", type: Vssc::TotalCount, method: :total_counts)
  has_and_belongs_to_many :total_counts

  define_element("PartyRegistration", type: Vssc::PartyRegistration, method: :party_registration)
  has_one :party_registration

  define_element("SpatialDimension", type: Vssc::SpatialDimension, method: :spatial_dimensions)
  has_and_belongs_to_many :spatial_dimensions
  
  define_attribute("object_id", required: true)
  define_attribute("URL")
  define_attribute("localGeoCode")
  define_attribute("name")
  define_attribute("nationalGeoCode")
  define_attribute("stateGeoCode")
  
  
end
