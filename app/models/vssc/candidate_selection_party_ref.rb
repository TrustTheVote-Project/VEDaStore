class Vssc::CandidateSelectionPartyRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :candidate_selection
  belongs_to :party, primary_key: :object_id, foreign_key: :object_id
  
  def self.parse_vssc(node)
    e = self.new
    e.object_id = node.text
    e
  end
  
  def to_xml_node(xml = nil, node_name = nil)
    xml.send("Party", self.object_id.to_s)
  end
  
  
end
