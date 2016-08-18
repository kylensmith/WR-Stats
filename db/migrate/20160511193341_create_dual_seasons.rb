class CreateDualSeasons < ActiveRecord::Migration
  def change
    create_table :dual_seasons do |t|
    	t.integer :season_id	
    	t.integer :school_id	
    	t.integer :division_id	
    	t.integer :coach_id	
    	t.integer :duals	
    	t.integer :wins	
    	t.integer :losses
    	t.integer :ties	
    	t.boolean :non_di

      t.timestamps null: false
    end
  end
end
