class CreateNcaaFinalDetails < ActiveRecord::Migration
  def change
    create_table :ncaa_final_details do |t|

      t.timestamps null: false
    end
  end
end
