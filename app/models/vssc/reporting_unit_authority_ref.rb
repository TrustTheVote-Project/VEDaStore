class Vssc::ReportingUnitAuthorityRef < ActiveRecord::Base
  belongs_to :reporting_unit
  # belongs_to :authority, primary_key: :object_id, foreign_key: :object_id
end
