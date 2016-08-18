class CreateTournamentSummaries < ActiveRecord::Migration
  def change
    create_table :tournament_summaries do |t|
    	t.references :season
    	t.integer :hofeventid	
    	t.string :ordinal	
    	t.date :start_date	
    	t.date :end_date	
    	t.string :location	
    	t.integer :team_champion	
    	t.integer :champs
    	t.float :points	
    	t.integer :weight_classes	
    	t.integer :places

      t.timestamps null: false
    end
  end
end
