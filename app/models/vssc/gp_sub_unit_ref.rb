class Vssc::GPSubUnitRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :gp_unit, :class_name=>"Vssc::GPUnit"
  belongs_to :gp_unit_ref, class_name: "Vssc::GPUnit", foreign_key: :object_id, primary_key: :object_id
  
  
  def self.parse_vssc(node)
    e = self.new
    e.object_id = node.text
    e
  end
  
  def to_xml_node(xml = nil, node_name = nil)
    xml.send("GPSubUnitRef", self.object_id.to_s)
  end
  
  
  
end
