class CreateTeamScores < ActiveRecord::Migration
  def change
    create_table :team_scores do |t|
    	t.integer :event_id
      t.integer :division_id
      t.integer :season_id
    	t.integer :school_id
    	t.integer :coach_id
    	t.float :points
    	t.integer :place
    	t.integer :champs
    	t.integer :place_winners



      t.timestamps null: false
    end
  end
end
