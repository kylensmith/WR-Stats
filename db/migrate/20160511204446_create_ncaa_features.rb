class CreateNcaaFeatures < ActiveRecord::Migration
  def change
    create_table :ncaa_features do |t|

      t.timestamps null: false
    end
  end
end
