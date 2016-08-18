class CreateSchoolParticipations < ActiveRecord::Migration
  def change
    create_table :school_participations do |t|

      t.timestamps null: false
    end
  end
end
