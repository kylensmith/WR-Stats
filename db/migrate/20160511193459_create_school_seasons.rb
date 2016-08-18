class CreateSchoolSeasons < ActiveRecord::Migration
  def change
    create_table :school_seasons do |t|
    	t.references :season
    	t.integer :school_id	
    	t.integer :coach_id	
    	t.float :points	
    	t.integer :place	
    	t.integer :champs	
    	t.integer :place_winners
    	t.integer :division_id

    	# This shouls apply to all divisions 

      t.timestamps null: false
    end
  end
end
