class CreateVsscSpatialDimensions < ActiveRecord::Migration
  def change
    create_table :vedastore_spatial_dimensions do |t|
      t.integer :spatial_extent_id
      t.string :map_uri
      
      t.timestamps null: false
    end
    add_index :vedastore_spatial_dimensions, :spatial_extent_id, name: :vedastore_spatial_dimension_spatial_extent
  end  
end
