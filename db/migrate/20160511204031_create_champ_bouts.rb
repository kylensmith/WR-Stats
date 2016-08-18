class CreateChampBouts < ActiveRecord::Migration
  def change
    create_table :champ_bouts do |t|

    	# not going to complete, right now

      t.timestamps null: false
    end
  end
end
