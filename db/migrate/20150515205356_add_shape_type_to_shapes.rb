class AddShapeTypeToShapes < ActiveRecord::Migration
  def change
    add_column :shapes, :shape_type, :string
  end
end
