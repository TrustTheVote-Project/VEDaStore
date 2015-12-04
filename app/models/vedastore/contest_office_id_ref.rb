class Vedastore::ContestOfficeIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :contest
  belongs_to :office, primary_key: :object_id, foreign_key: :office_id_ref, class_name: "Vedastore::Office"
  include Vedaspace::ContestOfficeIdRef

end