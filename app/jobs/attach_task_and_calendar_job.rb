class AttachTaskAndCalendarJob < ApplicationJob
  queue_as :default

  def perform
    AttachTaskAndCalendar.call
  end
end
