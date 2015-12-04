class Vedastore::CandidateContest < Vedastore::Contest
  include XsdRailsFunctions

  has_many :contest_office_id_refs, foreign_key: :contest_id
  has_many :offices, through: :contest_office_id_refs
  include Vedaspace::CandidateContest
  
end
