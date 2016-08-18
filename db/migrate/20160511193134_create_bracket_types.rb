class CreateBracketTypes < ActiveRecord::Migration
  def change
    create_table :bracket_types do |t|
    	t.integer :bracket_id	
    	t.string :bracket_name

      t.timestamps null: false
    end
  end
end
