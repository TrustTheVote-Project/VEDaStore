class ElectionResultUpload < ActiveRecord::Base

  belongs_to :election_report, :class_name=>"Vssc::ElectionReport"

  after_create :save_file
  
  def file=(file)
    @file = file
    self.file_name = file.respond_to?(:original_filename) ? file.original_filename : file.path
  end
  def file
    @file
  end
  
  def save_file
    File.open(path, "w+") do |f|
      f.write file.read
    end
  end
  
  def path
    dir = Rails.root.join('tmp', 'result_uploads', self.id.to_s)
    FileUtils.mkdir_p(dir)
    return dir.join(self.file_name)
  end
  
  def percent_complete
    (self.rows_processed.to_i * 100 / (self.row_count.to_i + 1)).to_i
  end
  
  def process!
    file = File.open(path)
    rows = CSV.parse(file.read.scrub, headers: true)
    file.close
    pending_rows = rows.length
    percent = 0
    self.update_attributes(row_count: pending_rows, rows_processed: 0)
    rows.each_with_index do |row, i|
      new_percent = (i * 100 / pending_rows).to_i
      if  new_percent > percent
        percent = new_percent
        self.update_attributes(rows_processed: i)
        puts self.rows_processed
      end
      contest_id = row['Contest_Id']
      # TODO: shouldn't use elections.first
      contest = election_report.elections.first.contests.where(object_id: "contest-#{contest_id}").first
      candidate_id = row['candidate_id']
      candidate_type = row["Candidate_Type"].to_s.downcase # C vs W for write-in
      candidate_selection = nil
      if contest.is_a?(Vssc::CandidateChoice)
        if candidate_type == "c"
          candidate_selection = contest.ballot_selections.where(object_id: "candidate-selection-#{candidate_id}").first
        elsif candidate_type == "w"
          #Add a write-in option
          #see if it's already added
          candidate_selection = contest.ballot_selections.where(object_id:  "candidate-selection-#{candidate_id}", is_write_in: true, type: Vssc::CandidateSelection).first
          if candidate_selection.nil?
            candidate_selection= Vssc::CandidateSelection.new
            candidate_selection.is_write_in = true
            candidate_selection.object_id = "candidate-selection-#{candidate_id}"
            candidate_selection.candidate_selection_candidate_refs << Vssc::CandidateSelectionCandidateRef.new(object_id: "candidate-#{candidate_id}")
            e = election_report.elections.first
            e.candidates << Vssc::Candidate.new(
              object_id: "candidate-#{candidate_id}",
              ballot_name: row["candidate_name"]
            )
            e.save!
            contest.ballot_selections << candidate_selection
          end
        end
      elsif contest.is_a?(Vssc::StraightParty)
        candidate_selection = contest.ballot_selections.where(local_party_code: "party-selection-#{candidate_id}").first
      elsif contest.is_a?(Vssc::BallotMeasure)        
        candidate_selection = contest.ballot_selections.where(object_id: "ballot-measure-selection-#{candidate_id}").first
      end
      if candidate_selection.nil?
        raise "No candidate selection for contest #{contest.type} #{contest.id}, candidate #{candidate_id}"
      end
      cc = "#{contest_id}-#{candidate_id}"
    
      vc_a = Vssc::VoteCount.new
      vc_e = Vssc::VoteCount.new
      vc = Vssc::VoteCount.new
      
      # find the precinct split with this ID
      ps = election_report.gp_units.where(object_id: "vspub-precinct-split-#{row["Pct_Id"]}").first
      vc_e.gp_unit = vc.gp_unit = vc_a.gp_unit = ps.object_id
      vc_a.object_id = "votecount-#{cc}-absentee"
      vc_a.ballot_type = Vssc::BallotType.absentee
      vc_a.count = row["absentee_votes"]
      vc_e.object_id = "votecount-#{cc}-early"
      vc_e.ballot_type = Vssc::BallotType.early
      vc_e.count = row["early_votes"]
      vc.object_id = "votecount-#{cc}-election-day"
      vc.ballot_type = Vssc::BallotType.election_day
      vc.count = row["election_votes"]
      # TODO: need to lookup the candidate_selection
      candidate_selection.vote_counts << vc
      candidate_selection.vote_counts << vc_a
      candidate_selection.vote_counts << vc_e
      
      # for the first candidate in the loop put in the totals
      if contest.contest_total_counts_by_gp_unit.size == 0
        total_count = Vssc::TotalCount.new
        total_count.gp_unit = ps.object_id
        total_count.object_id = "total-counts-#{total_count.gp_unit}-#{contest_id}"
        total_count.ballots_cast = row["total_ballots"]
        total_count.overvotes = row["total_over_votes"]
        total_count.undervotes = row["total_under_votes"]
        contest.contest_total_counts_by_gp_unit << Vssc::ContestTotalCountsByGPUnit.new(total_count: total_count)
      end
      #candidate_selection.save!
      contest.save!
    end
    # TODO: when uploading results, change the report status. To what?
    
    new_percent = (i * 100 / pending_rows).to_i
    if  new_percent > percent
      percent = new_percent
      self.update_attributes(rows_processed: i)
      puts self.rows_processed
    end
    
    
    election_report.status = Vssc::ReportStatus.unofficial_complete
    election_report.save!  
  end
  
end
