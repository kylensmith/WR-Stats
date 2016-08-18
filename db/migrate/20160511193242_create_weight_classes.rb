class CreateWeightClasses < ActiveRecord::Migration
  def change
    create_table :weight_classes do |t|
    	t.integer :season_id	
    	t.string :weight	
    	t.integer :entries	
    	t.integer :rounds	
    	t.boolean :left_column
      t.timestamps null: false
    end
  end
end
