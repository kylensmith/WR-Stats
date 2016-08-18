class CreateTeamRankings < ActiveRecord::Migration
  def change
    create_table :team_rankings do |t|
    	t.references :season
    	t.integer :team_ranking_release_id
    	t.integer :rank	
    	t.integer :school_id

      t.timestamps null: false
    end
  end
end
