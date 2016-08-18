class CreateNationalDualSchools < ActiveRecord::Migration
  def change
    create_table :national_dual_schools do |t|

      t.timestamps null: false
    end
  end
end
