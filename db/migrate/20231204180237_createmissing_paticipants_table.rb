class CreatemissingPaticipantsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :missing_days do |t|
      t.references :participant, null: false, foreign_key: true
      t.date :start, null: false
      t.date :end, null: false
      
      t.timestamps
    end
  end
end
