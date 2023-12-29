class RemoveTaskIndividualNotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :task_individual_notes
    change_column_null :tasks, :task_final_note, true
  end
end
