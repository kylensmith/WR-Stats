class CreateNcaaFinals < ActiveRecord::Migration
  def change
    create_table :ncaa_finals do |t|

      t.timestamps null: false
    end
  end
end
