class Vssc::CandidateOfficeRef < ActiveRecord::Base
  
  belongs_to :candidate
  belongs_to :office, primary_key: :object_id, foreign_key: :object_id
  
end
