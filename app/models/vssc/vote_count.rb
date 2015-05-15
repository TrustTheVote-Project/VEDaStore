class Vssc::VoteCount < Vssc::Count
  
  has_and_belongs_to_many :ballot_selections
  
  define_attribute("count", type: Float)
  
  def report_gp_unit
    ballot_selections.first.contest.election.election_report.gp_units.where(object_id: gp_unit).first
  end
  
end
