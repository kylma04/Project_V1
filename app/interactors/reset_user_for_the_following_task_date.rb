class ResetUserForTheFollowingTaskDate
  include Interactor

  def call
    undone_tasks = Task.where(task_final_note: nil)
    count = undone_tasks.count

    undone_tasks.reverse_each.with_index do |task, index|
      if index == count - 1
        task.update(participant_id: context.participant.id)
      else
        next_participant = tasks[index + 1].participant
        task.update(participant_id: next_participant.id)
      end
    end
  end
end

