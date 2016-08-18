class CreateCoachAwards < ActiveRecord::Migration
  def change
    create_table :coach_awards do |t|
    	t.integer :coach_id	
    	t.integer :totalchamps	
    	t.integer :totalaas	
    	t.float :goldpct	
    	t.float :aapct

      t.timestamps null: false
    end
  end
end
