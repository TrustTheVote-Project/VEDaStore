class AddBallotStyleRelations < ActiveRecord::Migration
  def change
    create_table :vssc_ballot_styles_ordered_contests, id: false do |t|
      t.belongs_to :ballot_style
      t.belongs_to :ordered_contest
    end
    add_index :vssc_ballot_styles_ordered_contests, :ballot_style_id, name: :bsoc_ballot_style_id
    add_index :vssc_ballot_styles_ordered_contests, :ordered_contest_id, name: :bsoc_ordered_contest_id
  end
end
