require 'sidekiq-scheduler'
class CalendriersController < ApplicationController
  before_action :require_user
  def index
    @voting_open = voting_open
    @participants = Participant.all
    @tasks = Task.all.order(created_at: :desc).limit(5)
    @participants_with_tasks = insert_informations_in_table
  end

  # ******JOUR FERIES******
  def holidays
    capi = Calendarific::V2.new('dnlIvkCDZQ0RJOmghXV3caJG0E1tCUxb')
  
    parameters = {
    'country' => 'CI',
    'year'    => Date.today.year
    }
  
    response = capi.holidays(parameters)
  
    holiday_dates = response["response"]["holidays"].map{ |holiday| holiday["date"] }.map { |date| date["iso"] }
  end


  def voting_open
    
    current_time = Time.now
    vote_period = VotePeriode.first

    start_time = vote_period.periode_begin
    end_time = vote_period.periode_end

    current_time >= start_time && current_time < end_time
  end
  def check_if_participant_has_voted_today
    @voted = Vote.where(voter: current_user, vote_periode_id: VotePeriode.first.id).last
  end

  def check_if_current_participant_is_current_participant_to_execute_today_task
    current_participant = session[:participant_id]

    today_task_participant = Task.where(tasks_calendar_id: TasksCalendar.where(date_cleaning_task: Date.today).first.id)
    
  end

  


  private

  def insert_informations_in_table
    tasks_with_participants = []
  
    tasks_calendars = TasksCalendar.order(date_cleaning_task: :desc).limit(5)
  
    tasks_calendars.each do |task_calendar|

      task = Task.find_by(tasks_calendar_id: task_calendar.id)

      participant = Participant.find_by(id: task.participant_id) if task
      
      tasks_with_participants << { task_calendar: task_calendar, task: task, participant: participant } if task && participant
    end

    tasks_with_participants.reverse!
  
    tasks_with_participants
  end
  


  def participant_params
    params.require(:participant).permit(:firstname, :lastname, :email)
  end

  def tasks_calendar_params
    params.require(:tasks_calendar).permit(:date_cleaning_task)
  end

  def vote_periodes_params
    params.require(:vote_periode).permit(:periode_begin, :periode_end)
  end

  def vote_params
    params.require(:vote).permit(:status)
  end

end

