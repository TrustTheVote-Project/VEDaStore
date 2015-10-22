# <xsd:complexType name="Candidate">
#   <xsd:sequence>
#     <xsd:element name="BallotName" type="InternationalizedText"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="FileDate" type="xsd:date" minOccurs="0"/>
#     <xsd:element name="IsIncumbent" type="xsd:boolean" minOccurs="0"/>
#     <xsd:element name="IsTopTicket" type="xsd:boolean" minOccurs="0"/>
#     <xsd:element name="PartyId" type="xsd:IDREF" minOccurs="0"/>
#     <xsd:element name="PersonId" type="xsd:IDREF" minOccurs="0"/>
#     <xsd:element name="PostElectionStatus" type="CandidatePostElectionStatus" minOccurs="0"/>
#     <xsd:element name="PreElectionStatus" type="CandidatePreElectionStatus" minOccurs="0"/>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>
class Vssc::Candidate < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :election
  
  define_element("BallotName", type: Vssc::InternationalizedText, belongs_to: true)

  define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collection)
  has_one :external_identifier_collection, :as=>:identifiable
  
  define_element("FileDate", type: "xsd:date")  
  define_element("IsIncumbent", type: "xsd:boolean")  
  define_element("IsTopTicket", type: "xsd:boolean")  
  
  define_element("PartyId", method: :party_identifier)
  define_element("PersonId", method: :person_identifier)

  define_element("PostElectionStatus", type: Vssc::Enum::CandidatePostElectionStatus)
  define_element("PreElectionStatus", type: Vssc::Enum::CandidatePreElectionStatus)
  
  define_attribute("objectId", required: true)
  
end
