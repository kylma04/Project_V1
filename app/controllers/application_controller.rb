class ApplicationController < ActionController::Base
  helper_method :require_user
  def current_user
    current_participant || current_administrator
  end
  private
  
  def current_participant
    return nil unless session[:participant_id]
    @current_participant ||= Participant.find(session[:participant_id])
  end
  def current_administrator
    return nil unless session[:administrator_id]
    @current_administrator ||= Administrator.find(session[:administrator_id])
  end

  def require_user
    return if session[:participant_id] || session[:administrator_id]
    flash[:alert] = "Vous devez être connecté(e) pour accéder à cette page."
    redirect_to connexion_index_path
  end

end
