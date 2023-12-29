class Vote < ApplicationRecord
  belongs_to :vote_periode
  belongs_to :voter, polymorphic: true
end