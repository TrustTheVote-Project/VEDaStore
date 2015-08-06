class CreateVsscInternationalizedTexts < ActiveRecord::Migration
  def change
    create_table :vssc_internationalized_texts do |t|

      t.timestamps null: false
    end
  end
end
