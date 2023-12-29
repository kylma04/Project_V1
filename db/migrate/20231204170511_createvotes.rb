class Createvotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.boolean :status, null: false
      t.references :vote_periode, null: false, foreign_key: true
      t.references :voter, polymorphic: true, null: false

      t.timestamps
    end
  end
end
