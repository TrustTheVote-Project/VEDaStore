# <xsd:complexType name="Election">
#   <xsd:sequence>
#     <xsd:element name="BallotStyleCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="BallotStyle" type="BallotStyle" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="CandidateCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Candidate" type="Candidate" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="Code" type="Code" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ContactInformation" type="ContactInformation" minOccurs="0"/>
#     <xsd:element name="ContestCollection" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Contest" type="Contest" minOccurs="1" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="CountStatus" type="CountStatus" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ElectionScopeId" type="xsd:IDREF"/>
#     <xsd:element name="Name" type="InternationalizedText"/>
#   </xsd:sequence>
#   <xsd:attribute name="Date" type="xsd:date" use="required"/>
#   <xsd:attribute name="EndDate" type="xsd:date"/>
#   <xsd:attribute name="Type" type="ElectionType" use="required"/>
# </xsd:complexType>
class Vssc::Election < ActiveRecord::Base
  include VsscFunctions
  
  define_element("Name", type: Vssc::InternationalizedText, belongs_to: true)
  
  define_element("Code", type: Vssc::Code, method: :codes)
  has_many :codes, :as=>:codeable
  
  define_element("ElectionScopeId", method: :election_scope_identifier)
  
  define_element("ContactInformation", type: Vssc::ContactInformation, belongs_to: true)
  
  define_element("BallotStyleCollection", type: Vssc::BallotStyle, method: :ballot_styles, passthrough: "BallotStyle")
  has_many :ballot_styles, dependent: :destroy
  
  define_element("CandidateCollection", type: Vssc::Candidate, method: :candidates, passthrough: "Candidate")
  has_many :candidates, dependent: :destroy
  
  define_element("ContestCollection", type: Vssc::Contest, method: :contests, passthrough: "Contest")
  has_many :contests, dependent: :destroy
  
  define_element("CountStatus", type: Vssc::CountStatus, method: :count_statuses)
  has_many :count_statuses, as: :count_statusable
  
  
  define_attribute("Date", required: true, type: Date, required: true)
  define_attribute("EndDate", required: true, type: Date)
  define_attribute("Type", required: true, type: Vssc::Enum::ElectionType, method: "election_type")
  
end
