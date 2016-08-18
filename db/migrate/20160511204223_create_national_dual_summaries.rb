class CreateNationalDualSummaries < ActiveRecord::Migration
  def change
    create_table :national_dual_summaries do |t|

      t.timestamps null: false
    end
  end
end
