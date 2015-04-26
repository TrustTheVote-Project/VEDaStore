class AddBallotSelectionRelations < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_selections_counts, id: false do |t|
      t.belongs_to :ballot_selection, index: true
      t.belongs_to :vote_count, index: true
    end
    
  end
end
