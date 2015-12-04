class Vedastore::OfficeOfficeHolderIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :office
  belongs_to :office_holder, primary_key: :object_id, foreign_key: :office_holder_id_ref, class_name: "Vedastore::Person"
  include Vedaspace::OfficeOfficeHolderIdRef
  
end