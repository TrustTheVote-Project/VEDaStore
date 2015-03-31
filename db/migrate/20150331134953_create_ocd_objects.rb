class CreateOcdObjects < ActiveRecord::Migration
  def change
    create_table :ocd_objects do |t|
      t.string :name
      t.string :unit_type
      t.string :district_type
      t.string :ocd_id
  
      t.timestamps null: false
    end
    add_reference :ocd_objects, :ocd_object, index: true
    add_index :ocd_objects, :ocd_id
  end
end
