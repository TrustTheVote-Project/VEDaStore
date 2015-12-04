class Vedastore::OrderedContestBallotSelectionIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :ordered_contest
  belongs_to :ballot_selection, primary_key: :object_id, foreign_key: :ballot_selection_id_ref, class_name: "Vedastore::BallotSelection"  
  include Vedaspace::OrderedContestBallotSelectionIdRef

end