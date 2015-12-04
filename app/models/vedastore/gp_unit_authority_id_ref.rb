class Vedastore::GpUnitAuthorityIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :gp_unit
  belongs_to :authority, primary_key: :object_id, foreign_key: :authority_id_ref, class_name: "Vedastore::Person"
  include Vedaspace::GpUnitAuthorityIdRef
  
end