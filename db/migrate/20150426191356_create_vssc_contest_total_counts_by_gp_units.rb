class CreateVsscContestTotalCountsByGpUnits < ActiveRecord::Migration
  def change
    create_table :vssc_contest_total_counts_by_gp_units do |t|
      t.belongs_to :contest, index: true
      t.belongs_to :total_count, index: true
      t.timestamps null: false
    end
  end
end
