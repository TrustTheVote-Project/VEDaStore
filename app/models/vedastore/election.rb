# <xsd:complexType name="Election">
#   <xsd:sequence>
#     <xsd:element name="BallotStyleCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="BallotStyle" type="BallotStyle" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="CandidateCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Candidate" type="Candidate" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#     <xsd:element name="ContestCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Contest" type="Contest" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ElectionScopeId" type="xsd:IDREF"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="Name" type="InternationalizedText"/>
#     <xsd:element name="StartDate" type="xsd:date"/>
#     <xsd:element name="EndDate" type="xsd:date" minOccurs="0"/>
#     <xsd:element name="Type" type="ElectionType"/>
#   </xsd:sequence>
# </xsd:complexType>

class Vedastore::Election < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Election
  
  # define_element("BallotStyleCollection", type: Vssc::BallotStyle, method: :ballot_styles, passthrough: "BallotStyle")
#   has_many :ballot_styles, dependent: :destroy
#   define_element("CandidateCollection", type: Vssc::Candidate, method: :candidates, passthrough: "Candidate")
#   has_many :candidates, dependent: :destroy
#
#   define_element("ContactInformation", type: Vssc::ContactInformation, belongs_to: true)
#
#   define_element("ContestCollection", type: Vssc::Contest, method: :contests, passthrough: "Contest")
#   has_many :contests, dependent: :destroy
#
#   define_element("CountStatus", type: Vssc::CountStatus, method: :count_statuses)
#   has_many :count_statuses, as: :count_statusable
#
#   define_element("ElectionScopeId", method: :election_scope_identifier)
#
#   define_element("ExternalIdentifiers", type: Vssc::ExternalIdentifierCollection, method: :external_identifier_collection)
#   has_one :external_identifier_collection, :as=>:identifiable
#
#   define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)
#
#
#   define_element("StartDate", type: Date)
#   define_element("EndDate", type: Date)
#   define_element("Type", type: Vssc::Enum::ElectionType, method: "election_type")
  
end
