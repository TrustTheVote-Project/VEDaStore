class CreateVsscCountStatuses < ActiveRecord::Migration
  def change
    create_table :vssc_count_statuses do |t|

      t.timestamps null: false
    end
  end
end
