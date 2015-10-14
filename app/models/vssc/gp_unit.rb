# <xsd:complexType name="GpUnit" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="ComposingGpUnitId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="Name" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="SummaryCounts" type="SummaryCounts" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>

class Vssc::GpUnit < ActiveRecord::Base
  include VsscFunctions

  belongs_to :election_report
    
  define_element("ComposingGpUnitId", type: Vssc::GpUnitComposingGpUnitIdRef, method: :gp_unit_composing_gp_unit_id_refs)
  has_many :gp_unit_composing_gp_unit_id_refs
  has_many :composing_gp_units, through: :gp_unit_composing_gp_unit_id_refs

  define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collections)
  has_many :external_identifier_collections, :as=>:identifiable
  
  define_element("Name")
    
  define_element("SummaryCounts", type: Vssc::SummaryCounts, method: :summary_counts)
  has_many :summary_counts, as: :summary_countable, class_name: "Vssc::SummaryCounts"

  define_attribute("ObjectId", required: true)
  
end
