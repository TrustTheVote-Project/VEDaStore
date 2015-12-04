class Vedastore::Coalition < Vedastore::Party
  include XsdRailsFunctions
  
  has_many :party_contest_id_refs
  has_many :contests, through: :party_contest_id_refs
  
  has_many :party_party_id_refs
  has_many :parties, through: :party_party_id_refs
  include Vedaspace::Coalition
  
end
