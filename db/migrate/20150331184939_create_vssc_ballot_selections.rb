class CreateVsscBallotSelections < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_selections do |t|
      t.string :object_id
      t.string :ballot_selection_id
      t.string :type
      
      t.string :abbreviation
      t.string :localPartyCode
      t.string :name
      t.string :nationalPartyCode
      t.string :statePartyCode
      
      t.string :selection
      
      t.boolean :is_write_in
      
      t.timestamps null: false
    end
  end
end
