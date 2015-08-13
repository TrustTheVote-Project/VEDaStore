# <xsd:complexType name="BallotStyle">
#   <xsd:sequence>
#     <xsd:element name="GpUnitId" type="xsd:IDREF" maxOccurs="unbounded"/>
#     <xsd:element name="ImageUri" type="xsd:anyURI" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="OrderedContest" type="OrderedContest" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
#   <xsd:attribute name="Id" type="xsd:string"/>
# </xsd:complexType>
class Vssc::BallotStyle < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election
  
  define_element("OrderedContest", method: :ordered_contests, type: Vssc::OrderedContest)
  has_many :ordered_contests

  define_element("GpUnitId", type: Vssc::BallotStyleGpUnitIdRef, method: :ballot_style_gp_unit_id_refs)
  has_many :ballot_style_gp_unit_id_refs
  has_many :gp_units, through: :ballot_style_gp_unit_id_refs
  
  define_element("ImageUri")
  
  
  define_element("PartyId", type: Vssc::BallotStylePartyIdRef, method: :ballot_style_party_id_refs)
  has_many :ballot_style_party_id_refs
  has_many :parties, through: :ballot_style_party_id_refs
  
  define_attribute("Id", method: :ballot_style_identifier)
  
end
