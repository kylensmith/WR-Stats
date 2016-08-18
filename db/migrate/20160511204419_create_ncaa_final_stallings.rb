class CreateNcaaFinalStallings < ActiveRecord::Migration
  def change
    create_table :ncaa_final_stallings do |t|

      t.timestamps null: false
    end
  end
end
