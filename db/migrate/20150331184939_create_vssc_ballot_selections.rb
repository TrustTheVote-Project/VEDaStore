class CreateVsscBallotSelections < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_selections do |t|
      t.string :object_id
      t.string :type      
      
      t.string :selection
      
      t.boolean :is_write_in
      
      t.string :abbreviation
      t.string :local_party_code
      t.string :name
      t.string :national_party_code
      t.string :state_party_code
      
      
      t.timestamps null: false
    end
    add_index :vssc_ballot_selections, :object_id
    add_reference :vssc_ballot_selections, :contest, index: true
  end  
end
