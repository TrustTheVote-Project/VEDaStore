class CreateVsscLanguageStrings < ActiveRecord::Migration
  def change
    create_table :vssc_language_strings do |t|

      t.timestamps null: false
    end
  end
end
