class CreateAllAmericans < ActiveRecord::Migration
  def change
    create_table :all_americans do |t|
    	t.integer :division_id	
    	t.references :season
    	t.string :weight	
    	t.integer :place	
    	t.integer :wrestler_id	
    	t.integer :school_id

      t.timestamps null: false
    end
  end
end
