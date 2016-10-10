class CreateAaPlaceWinners < ActiveRecord::Migration
  def change
    create_table :aa_place_winners do |t|
    	t.integer :wrestler_id
    	t.integer :division_id
    	t.integer :school_id
    	t.references :season
    	t.string :weight
    	t.integer :place
    	t.string :ordinal
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
