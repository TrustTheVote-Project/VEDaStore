class AddContestRelations < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_selections_contests, id: false do |t|
      t.belongs_to :ballot_selection, index: true
      t.belongs_to :contest, index: true
    end
  end
end
