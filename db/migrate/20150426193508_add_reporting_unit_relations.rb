class AddReportingUnitRelations < ActiveRecord::Migration
  def change
    create_table :vssc_contacts_gp_units, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :reporting_unit, index: true
    end
  end
end
