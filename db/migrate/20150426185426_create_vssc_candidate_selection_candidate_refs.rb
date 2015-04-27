class CreateVsscCandidateSelectionCandidateRefs < ActiveRecord::Migration
  def change
    create_table :vssc_candidate_selection_candidate_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_index :vssc_candidate_selection_candidate_refs, :object_id, name: :cscr_object_id
    
    add_reference :vssc_candidate_selection_candidate_refs, :candidate_selection, index: {name: :cscr_candidate_selection_id}
  end
end
