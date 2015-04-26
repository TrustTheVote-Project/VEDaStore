class AddElectionRelations < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_styles_elections, id: false do |t|
      t.belongs_to :election, index: true
      t.belongs_to :ballot_style, index: true
    end
    create_table :vssc_candidates_elections, id: false do |t|
      t.belongs_to :election, index: true
      t.belongs_to :candidate, index: true
    end
    create_table :vssc_contests_elections, id: false do |t|
      t.belongs_to :election, index: true
      t.belongs_to :contest, index: true
    end
  end
end
