class UpdateVotePeriodeJob < ApplicationJob
  queue_as :default

  def perform

    Time.zone = "Africa/Abidjan"
    current_date = Time.zone.now.to_date

    periode_begin = Time.zone.local(current_date.year, current_date.month, current_date.day, 17, 0, 0)
    periode_end = Time.zone.local(current_date.year, current_date.month, current_date.day, 21, 0, 0)

    VotePeriode.update_all(periode_begin: periode_begin, periode_end: periode_end)
  end
end