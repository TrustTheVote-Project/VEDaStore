class Vssc::CandidateOfficeRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :candidate
  belongs_to :office, primary_key: :object_id, foreign_key: :object_id
  
  
  def self.parse_vssc(node)
    e = self.new
    e.object_id = node.text
    e
  end
  
  def to_xml_node(xml = nil, node_name = nil)
    xml.send("Office", self.object_id.to_s)
  end
  
  
  
end
