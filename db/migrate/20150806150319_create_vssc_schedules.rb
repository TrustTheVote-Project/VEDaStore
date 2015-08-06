class CreateVsscSchedules < ActiveRecord::Migration
  def change
    create_table :vssc_schedules do |t|

      t.timestamps null: false
    end
  end
end
