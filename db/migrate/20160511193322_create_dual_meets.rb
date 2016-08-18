class CreateDualMeets < ActiveRecord::Migration
  def change
    create_table :dual_meets do |t|
    	t.integer :team_id	
    	t.integer :season_id	
    	t.integer :meet	
    	t.date :date	
    	t.integer :meet_number	
    	t.string :site	
    	t.integer :opponent_id	
    	t.float :team_score	
    	t.float :opponent_score	
    	t.string :result	
    	t.integer :w	
    	t.integer :l	
    	t.integer :t

      t.timestamps null: false
    end
  end
end
