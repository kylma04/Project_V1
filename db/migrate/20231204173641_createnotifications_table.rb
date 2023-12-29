class CreatenotificationsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :content, null: false
      t.references :participant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
