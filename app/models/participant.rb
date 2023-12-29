class Participant < ApplicationRecord
  has_secure_password
  has_many :votes, as: :voter
  has_many :missing_days
  has_many :notifications
  has_many :tasks
  has_one :punition
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
  def self.first_selected
    punished_users = where(punish: true).order(punish_at: :desc)
    lowest_passcount_user = order(:pass_count)

    (punished_users + lowest_passcount_user).first
  end

end