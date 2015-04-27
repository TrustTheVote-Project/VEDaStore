class CreateVsscPartyRegistrations < ActiveRecord::Migration
  def change
    create_table :vssc_party_registrations do |t|
      t.string :object_id
      t.integer :count
      t.timestamps null: false
    end
    add_index :vssc_party_registrations, :object_id
    add_reference :vssc_party_registrations, :party, index: true
  end
end
