class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons, id: false do |t|
    	# t.primary_key :year, null: false
        t.integer :year, null: false

        # suggestion?
        # t.primary_key :year, :string

        # t.integer :year
        # , null: false, index: :unique	
    	t.timestamp :last_update	
    	t.integer :word_count	
    	t.integer :start_date
    	t.integer :end_date	
    	t.string :location
    	t.integer :team_champ_id
    	t.integer :champion_points
    	t.integer :total_schools	
    	t.integer :total_participants	
    	t.integer :total_bouts	
    	t.integer :total_points	
    	t.integer :total_weight_classes	
    	t.integer :places	
    	t.boolean :complete	
    	t.boolean :audited	
    	t.integer :jpeg
    	t.string :jpeg_path
    	t.integer :hofeventid	
    	t.string :comments

      t.timestamps null: false
    end
    add_index :seasons, :year, unique: true
    # change_column :seasons, :year, :string
  end
end




