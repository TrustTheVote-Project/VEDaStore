class ChangeShapeDataColumnType < ActiveRecord::Migration
  def up
    change_column :shapes, :shape_data, :binary, :limit=>10.megabytes
  end
  def down
    change_column :shapes, :shape_data, :text
  end
end
