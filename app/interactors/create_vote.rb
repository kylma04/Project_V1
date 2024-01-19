class CreateVote
  include Interactor

  def call
    return unless vote_open?
    context.vote = Vote.create(voter: context.voter, status: context.status, vote_periode_id: vote_period.id)
  end

  private

  def vote_open?
    today_task_calendar = TasksCalendar.find_by(date_cleaning_task: Date.today)
    return false unless today_task_calendar

    current_hour = Time.now.strftime("%H:%M:%S")
    periode_begin = today_task_calendar.date_cleaning_task.to_datetime
    periode_end = periode_begin.end_of_day

    current_time = Time.parse(current_hour)
    current_time.between?(periode_begin, periode_end)
  end

  def vote_period
    VotePeriode.first
  end
end
