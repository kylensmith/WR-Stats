class CreateDualMeets < ActiveRecord::Migration
  def change
    create_table :dual_meets do |t|
        t.integer :season_id	
    	t.date :date
        t.time :time	 		
    	t.string :site	
    	t.integer :team1
        t.integer :team2	
    	t.float :team1_score	
    	t.float :team2_score	
    	t.boolean :tie_break	
    	t.integer :w	
    	t.integer :l	
    	t.boolean :t
        t.integer :attendance
        t.boolean :complete
        t.boolean :estimated

        # estimated is used when a part of the record, such as the date or attendance, can not be confirmed


      t.timestamps null: false
    end
  end
end
