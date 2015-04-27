class CreateVsscOrderedContestBallotSelectionRefs < ActiveRecord::Migration
  def change
    create_table :vssc_ordered_contest_ballot_selection_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_reference :vssc_ordered_contest_ballot_selection_refs, :ordered_contest, index: {name: :ocbsr_ordered_contest_id}
    add_index :vssc_ordered_contest_ballot_selection_refs, :object_id, name: :ocbsr_object_id
    
  end
end
