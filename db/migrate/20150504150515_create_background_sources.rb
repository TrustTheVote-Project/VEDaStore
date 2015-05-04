class CreateBackgroundSources < ActiveRecord::Migration
  def change
    create_table :background_sources do |t|
      t.string :name
      t.timestamps null: false
    end
    add_reference :background_sources, :jurisdiction, index: true
  end
end
