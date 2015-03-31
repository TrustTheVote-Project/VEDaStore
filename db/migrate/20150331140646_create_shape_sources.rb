class CreateShapeSources < ActiveRecord::Migration
  def change
    create_table :shape_sources do |t|
      t.string :name
      t.text :contact_info
      t.text :source_data
      t.timestamps null: false
    end
  end
end
