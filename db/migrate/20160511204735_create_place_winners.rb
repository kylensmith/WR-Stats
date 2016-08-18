class CreatePlaceWinners < ActiveRecord::Migration
  def change
    create_table :place_winners do |t|

      t.timestamps null: false
    end
  end
end
