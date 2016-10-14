class CreateWrestlers < ActiveRecord::Migration
  def change
    create_table :wrestlers do |t|	
    	t.string :name	
    	t.integer :hofid	
    	t.boolean :all_american	
    	t.boolean :transfer	
    	t.boolean :division_i	
    	t.boolean :division_ii	
    	t.boolean :division_iii	
    	t.boolean :naia	
    	t.boolean :njcaa	
    	t.boolean :eiwa	
    	t.boolean :big_10	
    	t.boolean :big_12	
    	t.string :high_school	
    	t.integer :state_id

      t.timestamps null: false
    end
  end
end



