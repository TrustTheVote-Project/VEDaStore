class CreateReportingUnits < ActiveRecord::Migration
  def change
    create_table :reporting_units do |t|
      t.string :name
      t.string :internal_id
      t.timestamps null: false
    end
    add_reference :reporting_units, :ocd_object, index: true
    add_reference :reporting_units, :jurisdiction, index: true
    create_join_table :reporting_units, :districts do |t|
      t.index :reporting_unit_id
      t.index :district_id
    end
  end
end
