class CreateVsscHours < ActiveRecord::Migration
  def change
    create_table :vssc_hours do |t|

      t.timestamps null: false
    end
  end
end
