class Participant < ApplicationRecord
  has_secure_password
  has_many :votes, as: :voter
  has_many :missing_days
  has_many :notifications
  has_many :tasks
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  
end