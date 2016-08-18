class CreateAaWrestlers < ActiveRecord::Migration
  def change
    create_table :aa_wrestlers do |t|

      t.timestamps null: false
    end
  end
end
