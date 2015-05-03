class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.string :name
      t.string :abbreviation
      t.text :contact_info
      t.timestamps null: false
    end
    add_reference :jurisdictions, :state, index: true
    
  end
end
