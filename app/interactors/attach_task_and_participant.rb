class AttachTaskAndParticipant
  include Interactor

  def call
    assign_tasks_to_empty_days
    display_participants_for_tasks
  end

  private

  def assign_tasks_to_empty_days
    tasks_sans_jour = TasksCalendar.joins(:task).where(tasks: {id: nil})
    tasks_sans_jour.each do |calendar|
      assign_task_to_calendar(calendar)
    end
  end

  def assign_task_to_calendar(calendar)
    available_participants = Participant.all.order(pass_count: :asc)

    available_participants.each do |participant|
      next if calendar.task || participant.pass_count <= 0

      unless participant_absent?(participant, calendar)
        task = Task.create(participant_id: participant.id, calendar_id: calendar.id)
        participant.update(pass_count: participant.pass_count - 1)
        break
      end
    end
  end

  def participant_absent?(participant, calendar)
    missing_days = participant.missing_days.where('start <= ? AND end >= ?', calendar.date, calendar.date)
    missing_days.exists?
  end

  def display_participants_for_tasks
    tasks = Task.includes(:participant, :calendar).where.not(participant_id: nil)

    tasks.each do |task|
      puts "Task ID: #{task.id}, Participant: #{task.participant.name}, Calendar ID: #{task.calendar.id}"
    end
  end
end