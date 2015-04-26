class CreateVsscPeople < ActiveRecord::Migration
  def change
    create_table :vssc_people do |t|
      t.string :object_id
      t.string :ethnicity
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :title
      t.string :profession
      t.string :nickname
      t.string :party
      t.timestamps null: false
    end
    add_index :vssc_people, :object_id
    add_reference :vssc_people, :vssc_party, index: true
  end
end
