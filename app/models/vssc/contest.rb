# <xsd:complexType name="Contest" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="Abbreviation" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="BallotSelection" type="BallotSelection" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="BallotSubTitle" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="BallotTitle" type="InternationalizedText" minOccurs="0"/>
#     <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ElectoralDistrictId" type="xsd:IDREF"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="HasRotation" type="xsd:boolean" minOccurs="0"/>
#     <xsd:element name="Name" type="xsd:string"/>
#     <xsd:element name="SequenceOrder" type="xsd:integer" minOccurs="0"/>
#     <xsd:element name="SubUnitsReported" type="xsd:integer" minOccurs="0"/>
#     <xsd:element name="SummaryCounts" type="SummaryCounts" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="TotalSubUnits" type="xsd:integer" minOccurs="0"/>
#     <xsd:element name="VoteVariation" type="VoteVariation" minOccurs="0"/>
#     <xsd:element name="OtherVoteVariation" type="xsd:string" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>

class Vssc::Contest < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election
  
  define_element("Abbreviation")
  
  define_element("BallotSelection", type: Vssc::BallotSelection, method: :ballot_selections)
  has_many :ballot_selections, class_name: "Vssc::BallotSelection", dependent: :destroy
  
  define_element("BallotSubTitle", type: Vssc::InternationalizedText, belongs_to: true)
  define_element("BallotTitle", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_element("CountStatus", type: Vssc::CountStatus, method: :count_statuses)
  has_many :count_statuses, as: :count_statusable

  define_element("ElectoralDistrictId", method: :electoral_district_identifier)

  define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collections)
  has_many :external_identifier_collections, :as=>:identifiable
  
  define_element("HasRotation", type: "xsd:boolean")
  
  define_element("Name")
  define_element("SequenceOrder", type: Fixnum)
  define_element("SubUnitsReported", type: Fixnum)

  define_element("SummaryCounts", type: Vssc::SummaryCounts, method: :summary_counts)
  has_many :summary_counts, as: :summary_countable, class_name: "Vssc::SummaryCounts"

  define_element("TotalSubUnits", type: Fixnum)
  define_element("VoteVariation", type: Vssc::Enum::VoteVariation )
  define_element("OtherVoteVariation")
  
  define_attribute("objectId", required: true)
  
end
