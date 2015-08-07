# <xsd:complexType name="OrderedContest">
#   <xsd:sequence>
#     <xsd:element name="ContestId" type="xsd:IDREF"/>
#     <xsd:element name="OrderedBallotSelectionId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
# </xsd:complexType>
class Vssc::OrderedContest < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :ballot_style
  
  define_element("ContestId", method: :contest_identifier)

  define_element("OrderedBallotSelectionId", type: Vssc::OrderedContestBallotSelectionIdRef, method: :ordered_contest_ballot_selection_id_refs)
  has_many :ordered_contest_ballot_selection_id_refs
  has_many :ballot_selections, through: :ordered_contest_ballot_selection_id_refs
  
end
