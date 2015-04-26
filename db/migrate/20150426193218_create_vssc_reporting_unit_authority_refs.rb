class CreateVsscReportingUnitAuthorityRefs < ActiveRecord::Migration
  def change
    create_table :vssc_reporting_unit_authority_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_index :vssc_reporting_unit_authority_refs, :object_id, name: :ruar_object_id
    
    add_reference :vssc_reporting_unit_authority_refs, :vssc_gp_unit, index: {name: :ruar_reporting_unit_id}
    
  end
end
