class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
    	t.string :event
    	t.string :alternate_name
    	t.integer :start_year


      t.timestamps null: false
    end
  end
end
