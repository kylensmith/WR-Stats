class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|	
    	t.integer :hof_id	
    	t.string :name	
    	t.integer :current_division
    	t.string :city
    	t.integer :state_id
      t.boolean :active
      t.integer :current_conference


    	# Needs to add more fields.

      t.timestamps null: false
    end
  end
end





