# <xsd:complexType name="BallotSelection" abstract="true">
#   <xsd:sequence>
#     <xsd:element name="VoteCountsCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="VoteCounts" type="VoteCounts" minOccurs="0" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#   </xsd:sequence>
#   <xsd:attribute name="ObjectId" type="xsd:ID" use="required"/>
# </xsd:complexType>
class Vssc::BallotSelection < ActiveRecord::Base
  include VsscFunctions
  
  define_element("VoteCountsCollection", type: Vssc::VoteCount, method: :counts, passthrough: "VoteCounts")
  has_many :counts, as: :countable
  
  define_attribute("ObjectId", :required=>true)
  
  
end