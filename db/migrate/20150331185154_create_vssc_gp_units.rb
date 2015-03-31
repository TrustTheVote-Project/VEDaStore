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
      t.integer :reporting_unit_type_id
      t.integer :total_participating_voters
      t.integer :total_precincts
      
      t.integer :device_type_id
      t.string :manufacturer
      t.string :serial_number
      
      t.integer :district_type_id
      
      t.timestamps null: false
    end
  end
end
