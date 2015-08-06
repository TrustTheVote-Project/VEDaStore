# <xsd:complexType name="GpUnit" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ComposingGpUnitId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="SummaryCounts" type="SummaryCounts" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
#   <xsd:attribute name="Name" type="xsd:string"/>
# </xsd:complexType>
class Vssc::GpUnit < ActiveRecord::Base
  include VsscFunctions
    
  has_many :reporting_unit_authority_refs
  has_and_belongs_to_many :contacts, foreign_key: :reporting_unit_id
    
  has_and_belongs_to_many :election_reports
  
  
  
  define_element("ComposingGpUnitId", type: String, method: :composing_gp_unit_ids)
  has_many :gp_unit_composing_gp_unit_ids
  has_many :composing_gp_unit_ids, through: :gp_unit_composing_gp_unit_ids
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :gp_unit_codes
  has_many :codes, through: :gp_unit_codes
    
  define_element("SummaryCounts", type: Vssc::SummaryCounts, method: :summary_counts)
  has_many :gp_unit_summary_counts
  has_many :summary_counts, through: :gp_unit_summary_counts

  define_attribute("ObjectId", required: true)
  define_attribute("Name")
  
end
