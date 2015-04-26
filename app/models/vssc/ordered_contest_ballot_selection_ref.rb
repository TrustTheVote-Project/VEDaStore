class Vssc::OrderedContestBallotSelectionRef  < ActiveRecord::Base
  belongs_to :ordered_contest
  belongs_to :ballot_selection, primary_key: :object_id, :foreign_key: :object_id
end
