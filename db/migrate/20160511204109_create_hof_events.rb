class CreateHofEvents < ActiveRecord::Migration
  def change
    create_table :hof_events do |t|
    	t.integer :event_id	
    	t.string :event_name	
    	t.integer :event_year	
    	t.integer :sponsor_id	
    	t.integer :division_id

      t.timestamps null: false
    end
  end
end
