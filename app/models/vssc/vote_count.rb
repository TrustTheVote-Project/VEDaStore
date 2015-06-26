class Vssc::VoteCount < Vssc::Count
  
  belongs_to :ballot_selection
  
  define_attribute("count", type: Float)
  
  def report_gp_unit
    ballot_selection.contest.election.election_report.gp_units.where(object_id: gp_unit).first
  end
  
end
