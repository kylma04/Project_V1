require 'sidekiq-scheduler'
class ConnexionController < ApplicationController
  before_action :authenticate, only: [:index]

  def index
  end
  
  def login_participant
    participant = Participant.find_by(email: params[:email])

    if (participant.present? && participant.authenticate(params[:password]))
      session[:participant_id]=participant.id
      redirect_to calendriers_path, notice: "Logged in successfully"
    else
      redirect_to connexion_index_path, notice: "Invalid email or password"
    end
  end

  def login_administrator
    administrator = Administrator.find_by(email: params[:email])

    if administrator.present? && administrator.authenticate(params[:password])
      session[:administrator_id]=administrator.id
      redirect_to calendriers_path, notice: "Logged in successfully"
    else
      redirect_to connexion_index_path, notice: "Invalid email or password"
    end
  end

  def logout_participant
    session.delete(:participant_id)
    redirect_to connexion_index_path
  end

  def logout_administrator
    session.delete(:administrator_id)
    redirect_to connexion_index_path
  end

  private

  def authenticate
    return unless session[:participant_id] || session[:administrator_id]
    redirect_to calendriers_path
  end
end
