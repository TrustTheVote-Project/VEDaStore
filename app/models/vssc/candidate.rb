# <xsd:complexType name="Candidate">
#   <xsd:sequence>
#     <xsd:element name="BallotName" type="InternationalizedText"/>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0"/>
#     <xsd:element name="PersonId" type="xsd:IDREF" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
#   <xsd:attribute name="FileDate" type="xsd:date"/>
#   <xsd:attribute name="Id" type="xsd:string"/>
#   <xsd:attribute name="IsIncumbent" type="xsd:boolean"/>
#   <xsd:attribute name="IsTopTicket" type="xsd:boolean"/>
#   <xsd:attribute name="PostElectionStatus" type="CandidatePostElectionStatus"/>
#   <xsd:attribute name="PreElectionStatus" type="CandidatePreElectionStatus"/>
#   <xsd:attribute name="SequenceOrder" type="xsd:integer"/>
# </xsd:complexType>
class Vssc::Candidate < ActiveRecord::Base
  include VsscFunctions
  
  define_element("BallotName", type: Vssc::InternationalizedText, belongs_to: true)

  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, as: :codeable
  
  define_element("PartyId", method: :party_identifier)
  define_element("PersonId", method: :person_identifier)
  
  
  
  define_attribute("ObjectId", required: true)
  define_attribute("FileDate", type: "xsd:date")  
  define_attribute("Id", method: :candidate_identifier)
  define_attribute("IsIncumbent", type: "xsd:boolean")  
  define_attribute("IsTopTicket", type: "xsd:boolean")  
  define_attribute("PostElectionStatus", type: Vssc::Enum::CandidatePostElectionStatus)
  define_attribute("PreElectionStatus", type: Vssc::Enum::CandidatePreElectionStatus)
  define_attribute("SequenceOrder", type: Fixnum)  
  
end
