class Vssc::CandidateSelectionPartyRef < ActiveRecord::Base
  
  belongs_to :candidate_selection
  belongs_to :party, primary_key: :national_party_code, foreign_key: :national_party_code
  
end
