# <xsd:complexType name="BallotSelection" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="SequenceOrder" type="xsd:integer" minOccurs="0"/>
#     <xsd:element name="VoteCountsCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="VoteCounts" type="VoteCounts" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#   </xsd:sequence>
#   <xsd:attribute name="objectId" type="xsd:ID" use="required"/>
# </xsd:complexType>
class Vssc::BallotSelection < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :contest
  
  define_element("SequenceOrder", type: Fixnum)
  define_element("VoteCountsCollection", type: Vssc::VoteCounts, method: :counts, passthrough: "VoteCounts")
  has_many :counts, as: :countable, class_name: "Vssc::VoteCounts"
  
  define_attribute("objectId", :required=>true)
  
  
end