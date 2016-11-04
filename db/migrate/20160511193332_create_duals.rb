class CreateDuals < ActiveRecord::Migration
  def change
    create_table :duals do |t|
      t.integer :season_id 
      t.date :date
      t.time :time      
      t.integer :site  
      t.integer :team1_id
      t.integer :team2_id  
      t.float :team1_score  
      t.float :team2_score  
      t.boolean :tie_break  
      t.integer :w_id  
      t.integer :l_id  
      t.boolean :t
      t.integer :attendance        
      t.boolean :complete
      t.boolean :estimated

        # estimated is used when a part of the record, such as the date or attendance, can not be confirmed

    	# t.integer :school_id	
    	# t.integer :opponent_id	
    	# t.references :season
    	# t.string :score	
    	# t.boolean :win	
    	# t.boolean :loss	
    	# t.boolean :tie
    	# passing ones and zeros for w/l/t as boolean to save space

      t.timestamps null: false
    end
  end
end
