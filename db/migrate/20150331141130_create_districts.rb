class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.string :internal_id
      t.string :district_type
      t.timestamps null: false
    end
    add_reference :districts, :ocd_object, index: true
    add_reference :districts, :jurisdiction, index: true
    add_reference :districts, :background_source, index: true
  end
end
