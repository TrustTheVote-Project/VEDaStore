class Vssc::CandidateSelectionCandidateRef < ActiveRecord::Base
  
  belongs_to :candidate_selection
  belongs_to :candidate, primary_key: :object_id, foreign_key: :object_id
  
end
