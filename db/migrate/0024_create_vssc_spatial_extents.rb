class CreateVsscSpatialExtents < ActiveRecord::Migration
  def change
    create_table :vssc_spatial_extents do |t|
      t.text :coordinates
      t.string :format
      
      t.timestamps null: false
    end
  end  
end
