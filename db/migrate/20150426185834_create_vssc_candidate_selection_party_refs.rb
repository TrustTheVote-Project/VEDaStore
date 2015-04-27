class CreateVsscCandidateSelectionPartyRefs < ActiveRecord::Migration
  def change
    create_table :vssc_candidate_selection_party_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_reference :vssc_candidate_selection_party_refs, :candidate_selection, index: {name: :cspr_candidate_selection_id}
    add_index :vssc_candidate_selection_party_refs, :object_id, name: :cspr_object_id
  end
end
