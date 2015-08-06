<xsd:complexType name="PartySelection">
	<xsd:complexContent>
		<xsd:extension base="BallotSelection">
			<xsd:sequence>
				<xsd:element name="PartyId" type="xsd:IDREF" maxOccurs="unbounded"/>
			</xsd:sequence>
		</xsd:extension>
	</xsd:complexContent>
</xsd:complexType>
class Vssc::PartySelection < BallotSelection
  
  define_element("PartyId", type: String, method: :party_ids)
  has_many :party_selection_party_ids
  has_many :party_ids, through: :party_selection_party_ids
  
end
