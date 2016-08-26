class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
        t.integer :division_id
    	t.references :season
    	t.integer :hofeventid	
    	t.string :ordinal
        t.string :name	
    	t.date :start_date	
    	t.date :end_date	
    	t.string :location	
    	t.integer :team_champion	
    	t.integer :champs
    	t.float :winners_points
        t.text :outstanding_wrestler
        t.integer :ow_wrestler_id
        t.integer :ow_school_id
        t.integer :total_schools
        t.integer :total_participants
        t.integer :total_points
    	t.integer :weight_classes	
    	t.integer :places


      t.timestamps null: false
    end
  end
end
