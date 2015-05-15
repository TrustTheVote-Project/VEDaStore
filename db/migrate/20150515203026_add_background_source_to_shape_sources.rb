class AddBackgroundSourceToShapeSources < ActiveRecord::Migration
  def change
    add_reference :shape_sources, :background_source, index: true
  end
end
