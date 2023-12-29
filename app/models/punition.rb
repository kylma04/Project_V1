class Punition < ApplicationRecord
  belongs_to :participant

  validates :reason, presence: true
  validates :punish_count, presence: true
end