class CreateCoachRecords < ActiveRecord::Migration
  def change
    create_table :coach_records do |t|
    	t.integer :coach_id	
    	t.integer :seasons	
    	t.integer :total_duals	
    	t.integer :total_wins	
    	t.integer :total_losses	
    	t.integer :total_ties


      t.timestamps null: false
    end
  end
end
