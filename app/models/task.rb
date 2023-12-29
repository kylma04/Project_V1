class Task < ApplicationRecord
  belongs_to :tasks_calendar
  belongs_to :participant
end