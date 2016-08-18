class CreateConsolationInputs < ActiveRecord::Migration
  def change
    create_table :consolation_inputs do |t|

    	# Going to skip, for now

      t.timestamps null: false
    end
  end
end
