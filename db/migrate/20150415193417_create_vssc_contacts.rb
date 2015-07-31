class CreateVsscContacts < ActiveRecord::Migration
  def change
    create_table :vssc_contacts do |t|
      t.string :name
      t.string :uri
      t.string :address_line
      t.string :email
      t.string :fax
      t.string :phone
      t.timestamps null: false
    end
  end
end
