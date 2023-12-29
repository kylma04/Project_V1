require 'sidekiq-scheduler'
class AttachTaskAndCalendar
  include Sidekiq::Worker
  include Interactor

  def call
    assign_tasks_to_empty_days
  end

  private

  def assign_tasks_to_empty_days
    days_without_task = TasksCalendar.left_outer_joins(:task).where(tasks: { id: nil }).order(date_cleaning_task: :asc)
    days_without_task.each do |day|
      assign_task_to_day(day)
    end
  end

  def assign_task_to_day(day)
    participant = Participant.first_selected
    return unless participant_absent_empty?(participant, day)
    task = Task.create(participant_id: participant.id, tasks_calendar_id: day.id)
    participant.update(pass_count: participant.pass_count + 1, punish: false, punish_at: nil)
  end

  def participant_absent_empty?(participant, day)
    abscent = participant.missing_days.where(created_at: day.date_cleaning_task.beginning_of_day..day.date_cleaning_task.end_of_day)
    abscent.empty?
  end
end
