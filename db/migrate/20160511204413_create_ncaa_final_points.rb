class CreateNcaaFinalPoints < ActiveRecord::Migration
  def change
    create_table :ncaa_final_points do |t|

      t.timestamps null: false
    end
  end
end
