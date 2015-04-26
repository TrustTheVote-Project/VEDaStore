class AddRelationsToGpUnits < ActiveRecord::Migration
  def change
    create_table :vssc_counts_gp_units, id: false do |t|
      t.belongs_to :gp_unit, index: true
      t.belongs_to :total_count, index: true
    end
    create_table :vssc_gp_units_spatial_dimensions, id: false do |t|
      t.belongs_to :gp_unit, index: true
      t.belongs_to :spatial_dimension, index: true
    end
  end
end
