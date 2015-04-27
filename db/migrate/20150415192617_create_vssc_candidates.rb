class CreateVsscCandidates < ActiveRecord::Migration
  def change
    create_table :vssc_candidates do |t|
      t.string :object_id
      t.string :ballot_name
      t.string :candidate_id
      t.string :party
      t.string :person
      t.datetime :file_date
      t.boolean :is_incumbent
      t.boolean :is_top_ticket
      t.integer :sequence_order
      t.string :status
      t.timestamps null: false
    end
    add_index :vssc_candidates, :object_id
    add_reference :vssc_candidates, :party, index: true
    add_reference :vssc_candidates, :person, index: true
  end
end
