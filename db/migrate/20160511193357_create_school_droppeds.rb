class CreateSchoolDroppeds < ActiveRecord::Migration
  def change
    create_table :school_droppeds do |t|
    	t.integer :season_id	
    	t.integer :school_id	
    	t.integer :league

      t.timestamps null: false
    end
  end
end
