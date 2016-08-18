class CreateNcaaFinalRecords < ActiveRecord::Migration
  def change
    create_table :ncaa_final_records do |t|

      t.timestamps null: false
    end
  end
end
