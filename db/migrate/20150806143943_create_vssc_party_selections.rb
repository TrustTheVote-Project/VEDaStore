class CreateVsscPartySelections < ActiveRecord::Migration
  def change
    create_table :vssc_party_selections do |t|

      t.timestamps null: false
    end
  end
end
