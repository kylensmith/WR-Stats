class CreatePlaceNames < ActiveRecord::Migration
  def change
    create_table :place_names do |t|

      t.timestamps null: false
    end
  end
end
