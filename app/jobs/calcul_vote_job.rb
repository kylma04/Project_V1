require 'ruby-calendarific'
require 'holidays'
class CalculVoteJob < ApplicationJob
  queue_as :default

  def perform
    days_holiday = get_holidays(Date.today.year) + get_holidays(Date.today.year+1)
    today = Date.today

    if days_holiday.include?(today)
      return
    end    

    CalculVote.call

    task = Task.find_by(tasks_calendar_id: TasksCalendar.find_by(date_cleaning_task: Date.today))

    participant = Participant.find_by(id: task.participant_id)

    # if task.task_final_note >= 80 && !participant.punish
    #   participant.update(pass_count: participant.pass_count + 1)
    #   return
    # end

    if task.task_final_note >= 80 && participant.punish
      punition = find_punition(participant)
      punition.update(punish_count: punition.punish_count - 1)

      if punition.punish_count == 0
        participant.update(punish: false, punish_at: nil)
      end
    end

  end

  private

  def get_holidays(year)
    capi = Calendarific::V2.new(ENV['CALENDARIFIC_KEY']) 
    parameters = {
      'country' => 'CI',
      'year'    => year
    }
    response = capi.holidays(parameters)
    holiday_dates = response["response"]["holidays"].map{ |holiday| holiday["date"] }.map { |date| date["iso"] }
  end

  def find_punition(participant)
    Punition.find_by(participant_id: participant.id)
  end

end
