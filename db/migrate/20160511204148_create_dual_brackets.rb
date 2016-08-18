class CreateDualBrackets < ActiveRecord::Migration
  def change
    create_table :dual_brackets do |t|

      t.timestamps null: false
    end
  end
end
