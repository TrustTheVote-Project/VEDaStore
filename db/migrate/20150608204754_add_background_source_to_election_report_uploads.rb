class AddBackgroundSourceToElectionReportUploads < ActiveRecord::Migration
  def change
    add_column :election_report_uploads, :background_source_id, :integer
  end
end
