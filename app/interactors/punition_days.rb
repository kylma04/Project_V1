class PunitionDays
  include Interactor

  def call
      
    today_date = Date.today

    task = Task.find_by(tasks_calendar_id: TasksCalendar.find_by(date_cleaning_task: Date.today))

    participants_voted_today_ids = Vote.where(created_at: periode_begin: today_date.beginning_of_day..today_date.end_of_day, voter_type: "Participant").pluck(:voter_id)

    all_participants_ids = Participant.where.not(id: Administrator.pluck(:id)).where.not(id: task.participant.id).pluck(:id)

    participants_not_voted_ids = all_participants_ids - participants_voted_today_ids

    participants_not_voted_ids.each do |participant_id|
      if find_participant_punition(participant_id)
        update_participant_punition_count(participant_id)
      else
        assign_punition_to_participant(participant_id)
      end
    end
  end

  private

  def assign_punition_to_participant(participant_id)
    Punition.create(participant_id: participant_id, reason: "Did not vote", punish_count: 1)
  end

  def update_participant_punition_count(participant_id)
    pinition = find_participant_punition(participant_id).update(punish_count: participant.punish_count + 1, reason: "Did not vote")
    if punition.punish_count == 3
      reset_participant_punition_count_and_set_punish_to_true(participant_id)
    end
  end

  def find_participant_punition(participant_id)
    Punition.find_by(participant_id: participant_id)
  end

  def reset_participant_punition_count_and_set_punish_to_true(participant_id)
    find_participant_punition(participant_id).update(punish_count: 2, reason: "Did not vote")
    participant(participant_id).update(punish: true, punish_at: Date.today)
  end

  def participant(participant_id)
    @participant ||= Participant.find(participant_id)
  end
end