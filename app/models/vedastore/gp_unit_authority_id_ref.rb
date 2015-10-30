class Vedastore::GpUnitAuthorityIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::GpUnitAuthorityIdRef
  
  belongs_to :gp_unit
  belongs_to :authority, primary_key: :object_id, foreign_key: :authority_id_ref, class_name: "Vedastore::Person"
  
end