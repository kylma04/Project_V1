class MissingDay < ApplicationRecord
  belongs_to :participant
  scope :for_participant, -> (date) { where('start_date <= ? AND end_date >= ?', date, date) }
end