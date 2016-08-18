class CreateRankingIndividuals < ActiveRecord::Migration
  def change
    create_table :ranking_individuals do |t|

      t.timestamps null: false
    end
  end
end
