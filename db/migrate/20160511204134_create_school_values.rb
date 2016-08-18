class CreateSchoolValues < ActiveRecord::Migration
  def change
    create_table :school_values do |t|
    	t.references :season	
    	t.integer :school_id	
    	t.integer :value

      t.timestamps null: false
    end
  end
end
