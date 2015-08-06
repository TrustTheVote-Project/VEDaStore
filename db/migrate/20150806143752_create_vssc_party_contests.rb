class CreateVsscPartyContests < ActiveRecord::Migration
  def change
    create_table :vssc_party_contests do |t|

      t.timestamps null: false
    end
  end
end
