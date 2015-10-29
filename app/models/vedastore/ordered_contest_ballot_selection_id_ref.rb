class Vedastore::OrderedContestBallotSelectionIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::OrderedContestBallotSelectionIdRef
  
  belongs_to :ordered_contest
  belongs_to :ballot_selection, primary_key: :object_id, foreign_key: :ballot_selection_id_ref, class_name: "Vedastore::BallotSelection"  

end