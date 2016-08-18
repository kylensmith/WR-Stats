class CreatePlaceScores < ActiveRecord::Migration
  def change
    create_table :place_scores do |t|
    	# skipping this table, for now
    	
    	# This shouls apply to all divisions

      t.timestamps null: false
    end
  end
end
