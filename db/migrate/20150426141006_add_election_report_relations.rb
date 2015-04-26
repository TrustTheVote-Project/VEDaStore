class AddElectionReportRelations < ActiveRecord::Migration
  def change
    create_table :vssc_election_reports_people, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :person, index: true
    end
    create_table :vssc_election_reports_parties, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :party, index: true
    end
    create_table :vssc_election_reports_offices, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :office, index: true
    end
    
  end
end
