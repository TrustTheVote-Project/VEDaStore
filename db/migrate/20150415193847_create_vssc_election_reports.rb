class CreateVsscElectionReports < ActiveRecord::Migration
  def change
    create_table :vssc_election_reports do |t|
      t.text :message
      t.string :object_id
      t.datetime :date
      t.string :format
      t.string :status
      t.string :issuer
      t.integer :sequence
      t.integer :sequence_end
      t.string :state_abbreviation
      t.string :state_code
      t.string :vendor_application_id
      t.timestamps null: false
    end
  end
end
