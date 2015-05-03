class CreateElectionReportUploads < ActiveRecord::Migration
  def change
    create_table :election_report_uploads do |t|
      t.integer :election_report_id
      t.integer :jurisdiction_id
      t.string :file_name
      t.string :source_type
      t.timestamps null: false
    end
    
  end
end
