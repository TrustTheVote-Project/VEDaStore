class CreateVsscPartyRegistrations < ActiveRecord::Migration
  def change
    create_table :vssc_party_registrations do |t|
      t.string :object_id
      t.string :party
      t.integer :count
      t.timestamps null: false
    end
    add_index :vssc_party_registrations, :object_id
  end
end
