class Vedastore::OfficeOfficeHolderIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::OfficeOfficeHolderIdRef
  
  belongs_to :office
  belongs_to :office_holder, primary_key: :object_id, foreign_key: :office_holder_id_ref, class_name: "Vedastore::Person"
  
end