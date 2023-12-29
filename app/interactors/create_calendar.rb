require 'ruby-calendarific'
require 'holidays'

class CreateCalendar
  include Interactor
  def call
    context.calendar = next_five_days
  end

  private

  def next_five_days
    create_cleaning_tasks
  end

  def get_holidays(year)
    capi = Calendarific::V2.new(ENV['CALENDARIFIC_KEY']) 
    parameters = {
      'country' => 'CI',
      'year'    => year
    }
    response = capi.holidays(parameters)
    holiday_dates = response["response"]["holidays"].map{ |holiday| holiday["date"] }.map { |date| date["iso"] }
  end


  def create_cleaning_tasks
    tasks_calendars = []

    date_actuelle = Date.today

    holiday_dates = get_holidays(Date.today.year) + get_holidays(Date.today.year+1)

    i = 1
    # if date_actuelle.thursday?
      while tasks_calendars.length < 5
        jour_suivant = date_actuelle + i
        i += 1

        next if jour_suivant.saturday? || jour_suivant.sunday? || holiday_dates.include?(jour_suivant.to_s)
        
        tasks_calendars << TasksCalendar.create(date_cleaning_task: jour_suivant)
      end
    # end
  end
end

