class CreatePigtails < ActiveRecord::Migration
  def change
    create_table :pigtails do |t|

      t.timestamps null: false
    end
  end
end
