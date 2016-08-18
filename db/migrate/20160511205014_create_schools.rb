class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|	
    	t.integer :hof_id	
    	t.string :name	
    	t.integer :current_division

    	# Needs to add more fields.

      t.timestamps null: false
    end
  end
end





