require 'sidekiq-scheduler'
class CalendriersController < ApplicationController
  before_action :require_user
  def index
    @voting_open = voting_open
    @participants = Participant.all
    @days=["jeudi", "vendredi", "lundi","mardi","mercredi",]
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
  end


  def voting_open
    
    current_time = Time.now
    vote_period = VotePeriode.first

    start_time = vote_period.periode_begin
    end_time = vote_period.periode_end

    current_time >= start_time && current_time < end_time
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

