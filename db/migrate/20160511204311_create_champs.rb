class CreateChamps < ActiveRecord::Migration
  def change
    create_table :champs do |t|
    	t.integer :wrestler_id	
    	t.string :wrestler	
    	t.integer :titles

      t.timestamps null: false
    end
  end
end
