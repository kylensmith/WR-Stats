class CreateWrestlerD1Records < ActiveRecord::Migration
  def change
    create_table :wrestler_d1_records do |t|

      t.timestamps null: false
    end
  end
end
