#     <xsd:element name="Term" minOccurs="0">
#       <xsd:complexType>
#         <xsd:sequence>
#           <xsd:element name="StartDate" type="xsd:date" minOccurs="0"/>
#           <xsd:element name="EndDate" type="xsd:date" minOccurs="0"/>
#           <xsd:element name="Type" type="OfficeTermType" minOccurs="0"/>
#         </xsd:sequence>
#         <xsd:attribute name="label" type="xsd:string"/>
#       </xsd:complexType>
#     </xsd:element>
class Vedastore::Term < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::Term
    
end
