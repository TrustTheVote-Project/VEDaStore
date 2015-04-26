class CreateVsscOrderedContests < ActiveRecord::Migration
  def change
    create_table :vssc_ordered_contests do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_index :vssc_ordered_contests, :object_id
    add_reference :vssc_ordered_contests, :vssc_contest, index: true
    
  end
end
