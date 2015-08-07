# <xsd:complexType name="Contest" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="BallotSelection" type="BallotSelection" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="BallotSubTitle" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="BallotTitle" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="JurisdictionalScopeId" type="xsd:IDREF"/>
#     <xsd:element name="Name" type="xsd:string"/>
#     <xsd:element name="SummaryCounts" type="SummaryCounts" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
#   <xsd:attribute name="Abbreviation" type="xsd:string"/>
#   <xsd:attribute name="HasRotation" type="xsd:boolean"/>
#   <xsd:attribute name="OtherVoteVariationType" type="xsd:string"/>
#   <xsd:attribute name="SequenceOrder" type="xsd:integer"/>
#   <xsd:attribute name="SubUnitsReported" type="xsd:integer"/>
#   <xsd:attribute name="TotalSubUnits" type="xsd:integer"/>
#   <xsd:attribute name="VoteVariationType" type="VoteVariationType"/>
# </xsd:complexType>
class Vssc::Contest < ActiveRecord::Base
  include VsscFunctions
  
  define_element("BallotSelection", type: Vssc::BallotSelection, method: :ballot_selections)
  has_many :ballot_selections, class_name: "Vssc::BallotSelection", dependent: :destroy
  
  define_element("BallotSubTitle", type: Vssc::InternationalizedText, belongs_to: true)
  define_element("BallotTitle", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("CountStatus", type: Vssc::Enum::CountStatus, method: :count_statuses)
  has_many :count_statuses, as: :count_statusable

  define_element("JurisdictionalScopeId", method: :jurisdictional_scope_identifier)
  
  define_element("Name")
  
  define_element("SummaryCounts", type: Vssc::SummaryCounts, method: :summary_counts)
  has_many :summary_counts, as: :summary_countable, class_name: "Vssc::SummaryCounts"
  
  define_attribute("ObjectId", required: true)
  define_attribute("Abbreviation")
  define_attribute("HasRotation", type: "xsd:boolean")
  define_attribute("OtherVoteVariationType")
  define_attribute("SequenceOrder", type: Fixnum)
  define_attribute("SubUnitsReported", type: Fixnum)
  define_attribute("TotalSubUnits", type: Fixnum)
  define_attribute("VoteVariationType", type: Vssc::Enum::VoteVariationType )
  
end
