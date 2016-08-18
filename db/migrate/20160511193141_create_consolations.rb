class CreateConsolations < ActiveRecord::Migration
  def change
    create_table :consolations do |t|


      t.timestamps null: false
    end
  end
end
