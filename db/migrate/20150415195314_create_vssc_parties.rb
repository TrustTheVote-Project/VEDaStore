class CreateVsscParties < ActiveRecord::Migration
  def change
    create_table :vssc_parties do |t|
      t.string :object_id
      t.string :abbreviation
      t.string :local_party_code
      t.string :name
      t.string :national_party_code
      t.string :state_party_code
      t.timestamps null: false
    end
    add_index :vssc_parties, :object_id
  end
end
