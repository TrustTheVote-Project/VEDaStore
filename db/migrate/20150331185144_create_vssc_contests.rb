class CreateVsscContests < ActiveRecord::Migration
  def change
    create_table :vssc_contests do |t|
      t.string :type
      t.string :name
      
      t.string :object_id
      t.string :contest_gp_scope
      t.string :abbreviation
      t.string :local_contest_code
      t.string :national_contest_code
      t.string :state_contest_code
      t.integer :reported_precincts
      t.integer :sequence_order
      t.integer :total_precincts
      
      t.integer :number_elected
      t.integer :votes_allowed
      
      t.integer :vote_variation
      
      t.text :full_text
      t.text :summary_text
      
      t.timestamps null: false
    end
    add_index :vssc_contests, :object_id
  end
end
