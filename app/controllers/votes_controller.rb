class VotesController < ApplicationController

  def create
    voter = if session[:participant_id]
      Participant.find(session[:participant_id])
    else
      Administrator.find(session[:administrator_id])
    end

    tasks_calendar = TasksCalendar.find_by(date_cleaning_task: Date.today)

    redirect_to calendriers_path and return unless tasks_calendar

    task = Task.find_by(participant_id: voter.id, tasks_calendar_id: tasks_calendar.id)

    redirect_to calendriers_path
     
    # and return unless task

    context = CreateVote.call(voter: voter, status: params[:vote])

    redirect_to calendriers_path if context.vote && context.success
  end
  
end