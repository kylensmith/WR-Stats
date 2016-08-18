class CreateSayengas < ActiveRecord::Migration
  def change
    create_table :sayengas do |t|

      t.timestamps null: false
    end
  end
end
