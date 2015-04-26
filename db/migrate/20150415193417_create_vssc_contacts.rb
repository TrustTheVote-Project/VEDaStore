class CreateVsscContacts < ActiveRecord::Migration
  def change
    create_table :vssc_contacts do |t|
      t.string :object_id
      t.string :name
      t.string :url
      t.string :address_number
      t.string :street_name
      t.string :city
      t.string :state_abbreviation
      t.string :postal_code
      t.string :country
      t.string :email
      t.string :fax
      t.string :phone
      t.string :hours
      t.timestamps null: false
    end
    add_index :vssc_contacts, :object_id
  end
end
