class CreateGorrarians < ActiveRecord::Migration
  def change
    create_table :gorrarians do |t|

      t.timestamps null: false
    end
  end
end
