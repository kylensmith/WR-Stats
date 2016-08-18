class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
    	t.integer :season_id	
    	t.string :weight	
    	t.integer :round101	
    	t.string :round101_result
    	t.integer :round102	
    	t.string :round102_result	
    	t.integer :round103	
    	t.string :round103_result
    	t.integer :round104	
    	t.string :round104_result	
    	t.integer :round105	
    	t.string :round105_result	
    	t.integer :round106	
    	t.string :round106_result	
    	t.integer :round107	
    	t.string :round107_result	
    	t.integer :round108	
    	t.string :round108_result
    	t.integer :round109
    	t.string :round109_result
    	t.integer :round110	
    	t.string :round110_result	
    	t.integer :round111	
    	t.string :round111_result	
    	t.integer :round112	
    	t.string :round112_result	
    	t.integer :round113	
    	t.string :round113_result	
    	t.integer :round114	
    	t.string :round114_result	
    	t.integer :round115	
    	t.string :round115_result	
    	t.integer :round116	
    	t.string :round116_result	
    	t.integer :round21	
    	t.string :round21_result	
    	t.integer :round22	
    	t.string :round22_result	
    	t.integer :round23	
    	t.string :round23_result	
    	t.integer :round24	
    	t.string :round24_result	
    	t.integer :round25	
    	t.string :round25_result	
    	t.integer :round26	
    	t.string :round26_result	
    	t.integer :round27	
    	t.string :round27_result	
    	t.integer :round28	
    	t.string :round28_result	
    	t.integer :qf1	
    	t.string :qf1_result	
    	t.integer :qf2	
    	t.string :qf2_result	
    	t.integer :qf3	
    	t.string :qf3_result	
    	t.integer :qf4	
    	t.string :qf4_result	
    	t.integer :sf1	
    	t.string :sf1_result	
    	t.integer :sf2	
    	t.string :sf2_result	
    	t.integer :champ	
    	t.string :champ_result
    	
      t.timestamps null: false
    end
  end
end
