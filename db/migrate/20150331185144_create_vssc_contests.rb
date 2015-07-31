class CreateVsscContests < ActiveRecord::Migration
  def change
    create_table :vssc_contests do |t|
      t.string :type
      t.string :name
      
      t.string :object_id
      t.string :contest_gp_scope
      t.string :abbreviation
      t.string :local_contest_code
      t.string :national_contest_code
      t.string :state_contest_code
      t.integer :reported_precincts
      t.integer :sequence_order
      t.integer :total_precincts
      
      t.string :office
      t.string :primary_party
      t.integer :number_elected
      t.integer :votes_allowed
      
      t.string :vote_variation
      
      # From BallotMeasureContest
      t.string :other_type
      t.string :ballot_measure_type
      
      t.integer :con_statement_id
      t.integer :effect_of_abstain_id
      t.integer :full_text_id
      t.integer :passage_threshold_id
      t.integer :pro_statement_id
      t.integer :summary_text_id
      
      
      
      t.timestamps null: false
    end
    add_index :vssc_contests, :object_id
    add_reference :vssc_contests, :election, index: true
  end
end
