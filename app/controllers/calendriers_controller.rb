class CalendriersController < ApplicationController
  before_action :require_user
  def index
    @participants = Participant.all
    @days=["vendredi", "lundi", "mardi", "mercredi", "jeudi"]
  end

  # ******JOUR FERIES******
  def holidays
    capi = Calendarific::V2.new('dnlIvkCDZQ0RJOmghXV3caJG0E1tCUxb')
  
    parameters = {
    'country' => 'CI',
    'year'    => Date.today.year
    }
  
    response = capi.holidays(parameters)
  
    holiday_dates = response["response"]["holidays"].map{ |holiday| holiday["date"] }.map { |date| date["iso"] }
    return holiday_dates
  end

  def assign_participant
    if Date.today.saturday? || Date.today.sunday? || holidays.include?(Date.today.to_s)
      render json: { message: "Pas de corvée de nettoyage le week-end et les jours feriés !" }
      return
    end

    participants = Participant.pluck(:id)
    today_cleaner = participants.sample

    Tasks.create(date: Date.today, participant_id: today_cleaner)

    render json: { message: "Participant #{today_cleaner} choisi pour la corvée de nettoyage aujourd'hui !" }
  end

  


  private

  def participant_params
    params.require(:participant).permit(:firstname, :lastname, :email)
  end

  def vote_periodes_params
    params.require(:vote_periode).permit(:periode_begin, :periode_end)
  end
  def vote_params
    params.require(:vote).permit(:status)
  end

end

