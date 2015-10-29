class Vedastore::BallotSelectionCandidateIdRef < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::BallotSelectionCandidateIdRef
  
  belongs_to :ballot_selection
  belongs_to :candidate, primary_key: :object_id, foreign_key: :candidate_id_ref, class_name: "Vedastore::Candidate"
  
end