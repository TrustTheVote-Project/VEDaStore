class CreateVsscOffices < ActiveRecord::Migration
  def change
    create_table :vssc_offices do |t|
      t.string :object_id
      t.string :name
      t.datetime :filing_date
      t.boolean :incumbent_running
      t.string :local_office_code
      t.string :national_office_code
      t.string :state_office_code
      t.boolean :partisan
      t.date :term_start_date
      t.date :term_end_date
      t.boolean :unexpired_term
      t.timestamps null: false
    end
    add_index :vssc_offices, :object_id
    # for office gp scope
    add_reference :vssc_offices, :gp_unit, index: true
    
  end
end
