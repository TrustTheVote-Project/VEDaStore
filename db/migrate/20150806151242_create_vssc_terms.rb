class CreateVsscTerms < ActiveRecord::Migration
  def change
    create_table :vssc_terms do |t|

      t.timestamps null: false
    end
  end
end
