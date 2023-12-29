class CreateNonVotePunishTable < ActiveRecord::Migration[7.1]
  def change
    create_table :punitions, id: :uuid do |t|
      t.references :participant, null: false, foreign_key: true
      t.string :reason, null: false
      t.integer :punish_count, null: false, default: 0
      t.timestamps
    end
  end
end
