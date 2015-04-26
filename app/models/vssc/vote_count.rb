class Vssc::VoteCount < Vssc::Count
  
  has_and_belongs_to_many :ballot_selections
  
  define_attribute("count", type: Float)
  
end
