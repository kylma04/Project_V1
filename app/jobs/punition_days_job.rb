class PunitionDaysJob < ApplicationJob
  queue_as :default

  def perform

    days_holiday = get_holidays(Date.today.year) + get_holidays(Date.today.year+1)
    today = Date.today
  
    if days_holiday.include?(today)
      return
    end 

    PunitionDays.call
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


