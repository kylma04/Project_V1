class VotePeriode < ApplicationRecord
  has_many :votes

  before_create :check_vote_period_unicity

  scope :is_vote_open?, ->(hour) { where("periode_begin <= ? AND periode_end >= ?", hour, hour) }

  def check_vote_period_unicity
    return if VotePeriode.count == 1
  end
end