class CreateCalendarJob < ApplicationJob
  queue_as :default

  def perform
    CreateCalendar.call
  end
end
