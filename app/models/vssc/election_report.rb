# <xsd:complexType name="ElectionReport">
#   <xsd:sequence>
#     <xsd:element name="Election" type="Election" minOccurs="0" maxOccurs="unbounded"/>
#     <xsd:element name="ExternalIdentifiers" type="ExternalIdentifiers" minOccurs="0"/>
#     <xsd:element name="Format" type="ReportDetailLevel"/>
#     <xsd:element name="GeneratedDate" type="xsd:dateTime"/>
#     <xsd:element name="GpUnitCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="GpUnit" type="GpUnit" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="Issuer" type="xsd:string"/>
#     <xsd:element name="IssuerAbbreviation" type="xsd:string"/>
#     <xsd:element name="IsTest" type="xsd:boolean" minOccurs="0"/>
#     <xsd:element name="Notes" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="OfficeCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Office" type="Office" maxOccurs="unbounded"/>
#           <xsd:element name="OfficeGroup" type="OfficeGroup" minOccurs="0" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="PartyCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Party" type="Party" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="PersonCollection" minOccurs="0" maxOccurs="unbounded">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="Person" type="Person" maxOccurs="unbounded"/>
#         </xsd:sequence>
#       </xsd:complexType>
#     </xsd:element>
#     <xsd:element name="SequenceStart" type="xsd:integer"/>
#     <xsd:element name="SequenceEnd" type="xsd:integer"/>
#     <xsd:element name="Status" type="ResultsStatus"/>
#     <xsd:element name="TestType" type="xsd:string" minOccurs="0"/>
#     <xsd:element name="VendorApplicationId" type="xsd:string"/>
#     <xsd:element ref="ds:Signature" minOccurs="0"/>
#   </xsd:sequence>
# </xsd:complexType>

require 'csv'
class Vssc::ElectionReport < ActiveRecord::Base
  #include VsscFunctions
  
  include NistErr::ElectionReport
  
  
end
