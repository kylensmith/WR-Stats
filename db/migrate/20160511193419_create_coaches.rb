class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
    	t.integer :coach_id	
    	t.string :name
    	t.string :lname
    	t.string :fname
    	t.boolean :active
      t.integer :total_seasons
      t.integer :total_duals
      t.integer :total_wins
      t.integer :total_losses
      t.integer :total_ties
      t.float :win_percentage
      t.integer :total_champs
      t.integer :total_aas
      t.float :aa_percentage
      t.float :champ_percentage
    	


      t.timestamps null: false
    end
  end
end
