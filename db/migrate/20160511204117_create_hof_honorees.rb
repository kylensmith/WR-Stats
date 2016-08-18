class CreateHofHonorees < ActiveRecord::Migration
  def change
    create_table :hof_honorees do |t|
    	t.integer :honoree_id	
    	t.string :fname	
    	t.string :lname	
    	t.string :mname	
    	t.string :nickname	
    	t.integer :year_inducted	
    	t.integer :honoree_type	
    	t.integer :wrestler_id	
    	t.integer :coach_id

      t.timestamps null: false
    end
  end
end
