class CreateHeadCoaches < ActiveRecord::Migration
  def change
    create_table :head_coaches do |t|

      t.timestamps null: false
    end
  end
end
