class CreateVsscCandidates < ActiveRecord::Migration
  def change
    create_table :vssc_candidates do |t|
      t.string :object_id
      t.string :ballot_name
      t.string :candidate_id
      t.datetime :file_date
      t.boolean :is_incumbent
      t.boolean :is_top_ticket
      t.integer :sequence_order
      t.string :status
      t.timestamps null: false
    end
    add_reference :vssc_candidates, :vssc_party, index: true
    add_reference :vssc_candidates, :vssc_person, index: true
  end
end
