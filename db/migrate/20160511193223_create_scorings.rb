class CreateScorings < ActiveRecord::Migration
  def change
    create_table :scorings do |t|
    	t.integer :season_id
    	t.integer :first
    	t.integer :second	
    	t.integer :third
    	t.integer :fourth
    	t.integer :fifth
    	t.integer :sixth
    	t.integer :seventh
    	t.integer :eighth
    	t.float :advance
    	t.float :consolation
    	t.integer :fall
    	t.integer :fft 
    	t.integer :tf 
    	t.integer :sd 
    	t.integer :md 
    	t.string :notes 
    	
      t.timestamps null: false
    end
  end
end
