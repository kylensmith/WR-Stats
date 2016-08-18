class CreateNcaaBouts < ActiveRecord::Migration
  def change
    create_table :ncaa_bouts do |t|

      t.timestamps null: false
    end
  end
end
