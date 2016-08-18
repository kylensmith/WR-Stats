class CreateOutstandingWrestlers < ActiveRecord::Migration
  def change
    create_table :outstanding_wrestlers do |t|
    	t.integer :division_id
    	t.integer :season_id
    	t.integer :wrestler_id
    	t.integer :school_id

      t.timestamps null: false
    end
  end
end
