class CreateVsscCounts < ActiveRecord::Migration
  def change
    create_table :vssc_counts do |t|
      t.string :type
      t.string :object_id
      t.integer :ballot_type_id
      t.string :device_manufacturer
      t.string :device_model
      t.integer :device_type_id
      
      t.integer :ballots_cast
      t.integer :overvotes
      t.integer :undervotes
      t.integer :write_ins
      
      t.float :count
      
      t.timestamps null: false
    end
  end
end
