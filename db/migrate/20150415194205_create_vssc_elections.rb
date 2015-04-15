class CreateVsscElections < ActiveRecord::Migration
  def change
    create_table :vssc_elections do |t|
      t.string :object_id
      t.string :name
      t.string :type
      t.date :date
      t.string :url
      t.string :absentee_count_status
      t.string :early_count_status
      t.string :election_day_count_status
      t.string :provisional_count_status
      t.string :write_in_count_status
      t.timestamps null: false
    end
    # for election gp scope
    add_reference :vssc_elections, :vssc_gp_unit, index: true
  end
end
