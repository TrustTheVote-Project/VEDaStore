class Vssc::CandidateChoice < Vssc::Contest
  define_element("Office")
  define_element("PrimaryParty")
  
  define_attribute("numberElected", type: Fixnum)
  define_attribute("votesAllowed", type: Fixnum, required: true)
  
end
