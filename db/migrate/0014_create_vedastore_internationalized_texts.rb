class CreateVsscInternationalizedTexts < ActiveRecord::Migration
  def change
    create_table :vedastore_internationalized_texts do |t|
      t.string :label
      
      t.timestamps null: false
    end
    
  end  
end
