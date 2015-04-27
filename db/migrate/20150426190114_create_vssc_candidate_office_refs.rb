class CreateVsscCandidateOfficeRefs < ActiveRecord::Migration
  def change
    create_table :vssc_candidate_office_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_reference :vssc_candidate_office_refs, :candidate, index: true
    add_index :vssc_candidate_office_refs, :object_id
  end
end
