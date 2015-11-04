# <xsd:complexType name="OrderedContest">
#   <xsd:sequence>
#     <xsd:element name="ContestId" type="xsd:IDREF"/>
#     <xsd:element name="OrderedBallotSelectionId" type="xsd:IDREF" minOccurs="0" maxOccurs="unbounded"/>
#   </xsd:sequence>
# </xsd:complexType>

class Vedastore::OrderedContest < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::OrderedContest
  
  belongs_to :ballot_style
  
  has_many :ordered_contest_ballot_selection_id_refs
  has_many :ballot_selections, through: :ordered_contest_ballot_selection_id_refs
  
end
