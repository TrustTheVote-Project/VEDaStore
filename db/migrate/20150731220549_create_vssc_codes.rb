class CreateVsscCodes < ActiveRecord::Migration
  def change
    create_table :vssc_codes do |t|
      t.string :other_type
      t.string :code_type
      t.string :value
      t.timestamps null: false
    end
  end
end
