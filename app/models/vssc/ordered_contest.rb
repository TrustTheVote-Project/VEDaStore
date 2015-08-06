# <xsd:complexType name="OrderedContest">
#   <xsd:sequence>
#     <xsd:element name="ContestId" type="xsd:IDREF"/>
#     <xsd:element name="OrderedBallotSelectionId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
# </xsd:complexType>
class Vssc::OrderedContest < ActiveRecord::Base
  include VsscFunctions
  
  define_element("ContestId")

  define_element("OrderedBallotSelectionId", type: String, method: :ordered_ballot_selection_ids)
  has_many :ordered_contest_ordered_ballot_selection_ids
  has_many :ordered_ballot_selection_ids, through: :ordered_contest_ordered_ballot_selection_ids
  
end
