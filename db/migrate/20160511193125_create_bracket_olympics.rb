class CreateBracketOlympics < ActiveRecord::Migration
  def change
    create_table :bracket_olympics do |t|
    	t.integer :year
    	t.string :weight
    	t.integer :bracket	
    	t.integer :round	
    	t.integer :winner	
    	t.integer :loser	
    	t.string :score	
    	t.integer :decision_type

      t.timestamps null: false
    end
  end
end
