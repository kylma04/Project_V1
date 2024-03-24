require 'ruby-calendarific'
require 'holidays'
class ParticipantRepassJob < ApplicationJob
  queue_as :default

  def perform

    days_holiday = get_holidays(Date.today.year) + get_holidays(Date.today.year+1)
    today = Date.today

    if days_holiday.include?(today)
      return
    end   

    task = Task.find_by(tasks_calendar_id: TasksCalendar.find_by(date_cleaning_task: Date.today))

    if task.task_final_note < 80
      ResetUserForTheFollowingTaskDate.call(participant: task.participant)
      return
    end

    if task.participant.punish
      ResetUserForTheFollowingTaskDate.call(participant: task.participant)
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

end

