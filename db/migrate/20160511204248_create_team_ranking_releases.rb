class CreateTeamRankingReleases < ActiveRecord::Migration
  def change
    create_table :team_ranking_releases do |t|
    	t.references :season
    	t.date :date
    	t.integer :teams_ranked
    	t.boolean :nwca
    	t.string :poll_name
    	t.string :alt_name
    	t.boolean :dual_ranking
      t.integer :division_id
    	t.string :date_text

      t.timestamps null: false
    end
  end
end
