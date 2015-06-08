class ElectionReportUpload < ActiveRecord::Base
  belongs_to :election_report, :class_name=>"Vssc::ElectionReport"
  belongs_to :jurisdiction
  
  belongs_to :background_source
  
end
