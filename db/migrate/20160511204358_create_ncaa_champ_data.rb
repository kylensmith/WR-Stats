class CreateNcaaChampData < ActiveRecord::Migration
  def change
    create_table :ncaa_champ_data do |t|

      t.timestamps null: false
    end
  end
end
