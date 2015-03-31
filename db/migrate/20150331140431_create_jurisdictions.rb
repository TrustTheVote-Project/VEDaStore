class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.string :name
      t.text :contact_info
      t.timestamps null: false
    end
  end
end
