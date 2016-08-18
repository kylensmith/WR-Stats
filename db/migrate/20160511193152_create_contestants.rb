class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
    	t.integer :season_id
    	t.string :weight	
    	t.integer :wrestler_id	
    	t.integer :bracket_position	
    	t.integer :consolation_position	
    	t.integer :seed	
    	t.integer :place

      t.timestamps null: false
    end
  end
end
