class CreateVsscSpatialExtents < ActiveRecord::Migration
  def change
    create_table :vssc_spatial_extents do |t|
      t.string :object_id
      t.string :format
      t.text :coordinates
      t.timestamps null: false
    end
    add_index :vssc_spatial_extents, :object_id    
    add_reference :vssc_spatial_extents, :spatial_dimension, index: true
  end
end
