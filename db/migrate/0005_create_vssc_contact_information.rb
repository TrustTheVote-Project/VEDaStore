class CreateVsscContactInformation < ActiveRecord::Migration
  def change
    create_table :vssc_contact_information do |t|
      t.text :address_line
      t.text :email
      t.text :fax
      t.string :name
      t.text :phone

      t.text :uri
      t.timestamps null: false
    end

  end  
end
