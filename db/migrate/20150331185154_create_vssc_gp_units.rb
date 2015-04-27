class CreateVsscGpUnits < ActiveRecord::Migration
  def change
    create_table :vssc_gp_units do |t|
      t.string :type
      t.string :object_id
      t.string :url
      t.string :local_geo_code
      t.string :name
      t.string :national_geo_code
      t.string :state_geo_code
      
      t.boolean :has_reported
      t.integer :registered_voters
      t.integer :reported_precincts
      t.string :reporting_unit_type
      t.integer :total_participating_voters
      t.integer :total_precincts
      
      t.string :device_type
      t.string :manufacturer
      t.string :serial_number
      
      t.string :district_type
    
      t.timestamps null: false
    end
    add_index :vssc_gp_units, :object_id
    add_reference :vssc_gp_units, :party_registration, index: true
    add_reference :vssc_gp_units, :gp_unit, index: true
  end
end
