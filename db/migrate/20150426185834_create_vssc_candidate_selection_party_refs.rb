class CreateVsscCandidateSelectionPartyRefs < ActiveRecord::Migration
  def change
    create_table :vssc_candidate_selection_party_refs do |t|
      t.string :national_party_code
      t.timestamps null: false
    end
    add_reference :vssc_candidate_selection_party_refs, :vssc_candidate_selection, index: {name: :cspr_candidate_selection_id}
    add_index :vssc_candidate_selection_party_refs, :national_party_code, name: :cspr_national_party_code
  end
end
