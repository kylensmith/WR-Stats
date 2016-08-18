class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
    	t.string :author_code	
    	t.string :author

      t.timestamps null: false
    end
  end
end
