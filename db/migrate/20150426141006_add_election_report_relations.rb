class AddElectionReportRelations < ActiveRecord::Migration
  def change
    create_table :vssc_election_reports_people, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :person, index: true
    end
    create_table :vssc_ballot_selections_election_reports, id: false do |t|
      t.belongs_to :election_report, index: {name: :bser_election_report_id}
      t.belongs_to :party, index: {name: :bser_party_id}
    end
    create_table :vssc_election_reports_offices, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :office, index: true
    end
    
  end
end
