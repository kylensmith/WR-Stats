class CreateWrestlerSchools < ActiveRecord::Migration
  def change
    create_table :wrestler_schools do |t|
    	t.references :season
      # , foreign_key: true
      # t.references(:season, index: true)
      # t.references :season
      # , unique: true, foreign_key: true, foreign_key_column_for: :season
    	# t.integer :season_id
    	# , index: true
    	t.integer :wrestler_id
    	# , index: true	
    	t.integer :school_id
    	# , index: true

      t.timestamps null: false
    end
    # add_foreign_key "seasons", "years"
# add_foreign_key :articles, :users, column: :author_id, primary_key: "lng_id"
  # add_foreign_key :wrestler_schools, :seasons, column: :season, primary_key: "year"
  # add_foreign_key(:wrestler_schools, :season, {:column=>:year, :primary_key=>"year"})
    # add_foreign_key :wrestler_schools, :wrestler_schools, column: :same_as_id
    # add_index :wrestler_schools, :season_id
  end
end







