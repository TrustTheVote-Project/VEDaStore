class Vssc::OrderedContestBallotSelectionIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :ordered_contest
  belongs_to :ballot_selection, primary_key: :object_id, foreign_key: :ballot_selection_id_ref, class_name: "Vssc::BallotSelection"
  
  define_text_node(:ballot_selection_id_ref)
  

end