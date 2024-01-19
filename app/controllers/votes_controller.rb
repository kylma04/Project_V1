class VotesController < ApplicationController

  def create
    voter = if session[:participant_id]
      Participant.find(session[:participant_id])
    else
      Administrator.find(session[:administrator_id])
    end

    context = CreateVote.call(voter: voter, status: params[:vote])

    redirect_to calendriers_path if context.vote && context.success
  end
end
