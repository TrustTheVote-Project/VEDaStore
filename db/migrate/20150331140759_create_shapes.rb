class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :internal_id
      t.text :shape_data
      t.timestamps null: false
    end
    add_reference :shapes, :ocd_object, index: true
    add_reference :shapes, :shape_source, index: true
  end
end
