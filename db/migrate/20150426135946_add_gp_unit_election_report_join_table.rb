class AddGpUnitElectionReportJoinTable < ActiveRecord::Migration
  def change
    create_table :vssc_election_reports_gp_units, id: false do |t|
      t.belongs_to :election_report, index: true
      t.belongs_to :gp_unit, index: true
    end
  end
end
