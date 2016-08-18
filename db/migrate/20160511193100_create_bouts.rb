class CreateBouts < ActiveRecord::Migration
  def change
    create_table :bouts do |t|
    	t.integer :season_id
    	t.string :weight
    	t.integer :bracket
    	t.integer :round
    	t.integer :winner_id  
    	t.integer :loser_id
    	t.string :score
    	t.integer :decision_type

      t.timestamps null: false
    end
  end
end
