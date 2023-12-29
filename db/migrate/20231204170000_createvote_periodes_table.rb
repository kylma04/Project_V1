class CreatevotePeriodesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :vote_periodes do |t|
      t.date :periode_begin, null: false
      t.date :periode_end, null: false

      t.timestamps
    end
  end
end
