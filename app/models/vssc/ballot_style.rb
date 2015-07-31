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
  
  
  define_element("GpUnitId", type: String, method: :gp_unit_ids)
  has_many :ballot_style_gp_unit_ids
  has_many :gp_unit_ids, through: :ballot_style_gp_unit_ids
  
  define_element("ImageUri")
  
  define_element("OrderedContest", method: :ordered_contests, type: OrderedContest)
  has_and_belongs_to_many :ordered_contests
  
  define_element("PartyId", type: String, method: :party_ids)
  has_many :ballot_style_party_ids
  has_many :party_ids, through: :ballot_style_party_ids
  
  define_attribute("Id", method: :ballot_style_id)
  
end
