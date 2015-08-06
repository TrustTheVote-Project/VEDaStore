class CreateVsscOfficeGroups < ActiveRecord::Migration
  def change
    create_table :vssc_office_groups do |t|

      t.timestamps null: false
    end
  end
end
