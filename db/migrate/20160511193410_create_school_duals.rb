class CreateSchoolDuals < ActiveRecord::Migration
  def change
    create_table :school_duals do |t|
    	t.integer :school_id	
    	t.integer :current_division	
    	t.integer :first_season	
    	t.integer :last_season	
    	t.integer :seasons	
    	t.integer :total_duals	
    	t.integer :total_wins	
    	t.integer :total_losses	
    	t.integer :total_ties	
    	t.boolean :complete	
    	t.integer :missing_record	
    	t.integer :missing_coach	
    	t.boolean :dropped	
    	t.integer :year_dropped

      t.timestamps null: false
    end
  end
end
