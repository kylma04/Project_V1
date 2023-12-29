class CreatetasksTable < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :tasks_calendar, null: false, foreign_key: true
      t.integer :task_individual_notes, null: false
      t.float :task_final_note, null: false

      t.timestamps
    end
  end
end
