class Vssc::BallotSelectionCandidateIdRef < ActiveRecord::Base
  include VsscFunctions
  
  belongs_to :ballot_selection
  belongs_to :candidate, primary_key: :object_id, foreign_key: :candidate_id_ref, class_name: "Vssc::Candidate"
  
  define_text_node(:candidate_id_ref)
  

end