class CreateVsscGpSubUnitRefs < ActiveRecord::Migration
  def change
    create_table :vssc_gp_sub_unit_refs do |t|
      t.string :object_id
      t.timestamps null: false
    end
    add_index :vssc_gp_sub_unit_refs, :object_id
    
    add_reference :vssc_gp_sub_unit_refs, :gp_unit, index: true
  end
end
