# <xsd:complexType name="Term">
#   <xsd:attribute name="EndDate" type="xsd:date"/>
#   <xsd:attribute name="StartDate" type="xsd:date"/>
#   <xsd:attribute name="Type" type="OfficeTermType"/>
# </xsd:complexType>
class Vssc::Term < ActiveRecord::Base
  include VsscFunctions
  
  define_attribute("EndDate", type: Date)
  define_attribute("StartDate", type: Date)
  define_attribute("Type", type: Vssc::Enum::OfficeTermType, method: :office_term_type)
  
end
