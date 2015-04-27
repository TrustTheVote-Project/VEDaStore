class CreateVsscCounts < ActiveRecord::Migration
  def change
    create_table :vssc_counts do |t|
      t.string :type
      t.string :gp_unit
      t.string :object_id
      t.string :ballot_type
      t.string :device_manufacturer
      t.string :device_model
      t.string :device_type
      
      t.integer :ballots_cast
      t.integer :overvotes
      t.integer :undervotes
      t.integer :write_ins
      
      t.float :count
      
      t.timestamps null: false
    end
    add_index :vssc_counts, :object_id
  end
end
