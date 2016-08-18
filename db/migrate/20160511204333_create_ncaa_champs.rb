class CreateNcaaChamps < ActiveRecord::Migration
  def change
    create_table :ncaa_champs do |t|

      t.timestamps null: false
    end
  end
end
