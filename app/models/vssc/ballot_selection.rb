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
  
  belongs_to :contest
  
  has_many :candidate_selection_candidate_refs, foreign_key: :candidate_selection_id
  
  
  define_element("VoteCountsCollection", type: Vssc::VoteCount, method: :counts, passthrough: "VoteCounts")
  has_many :counts
  
  define_attribute("ObjectId", :required=>true)

  
  def totals
    self.counts.group(:ballot_type).sum(:count)
  end
  
  def name
  end
  
end