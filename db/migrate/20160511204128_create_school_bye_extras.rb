class CreateSchoolByeExtras < ActiveRecord::Migration
  def change
    create_table :school_bye_extras do |t|
    	t.references :season
    	t.integer :school_id	
    	t.integer :byepoints

      t.timestamps null: false
    end
  end
end
