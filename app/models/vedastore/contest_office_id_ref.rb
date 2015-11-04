class Vedastore::ContestOfficeIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::ContestOfficeIdRef
  
  belongs_to :contest
  belongs_to :office, primary_key: :object_id, foreign_key: :office_id_ref, class_name: "Vedastore::Office"

end