class Vedastore::OfficeGroupOfficeIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::OfficeGroupOfficeIdRef
  
  belongs_to :office_group
  belongs_to :office, primary_key: :object_id, foreign_key: :office_id_ref, class_name: "Vedastore::Office"
  
end