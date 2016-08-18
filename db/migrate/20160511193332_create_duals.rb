class CreateDuals < ActiveRecord::Migration
  def change
    create_table :duals do |t|
    	t.integer :school_id	
    	t.integer :opponent_id	
    	t.references :season
    	t.string :score	
    	t.boolean :win	
    	t.boolean :loss	
    	t.boolean :tie
    	# passing ones and zeros for w/l/t as boolean to save space

      t.timestamps null: false
    end
  end
end
