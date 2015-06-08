class CreateElectionResultUploads < ActiveRecord::Migration
  def change
    create_table :election_result_uploads do |t|
      t.integer :election_report_id
      t.integer :row_count
      t.integer :rows_processed
      t.string :file_name
      t.string :source_type
      t.timestamps null: false
    end
  end
end
