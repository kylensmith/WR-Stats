class CreateResultTypes < ActiveRecord::Migration
  def change
    create_table :result_types do |t|
    	t.string :result_type

      t.timestamps null: false
    end
  end
end
