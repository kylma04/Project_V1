class VotesController < ApplicationController

  def create
    voter = if session[:participant_id]
      Participant.find(session[:participant_id])
    else
      Administrator.find(session[:administrator_id])
    end

    context = CreateVote.call(voter: voter, status: params[:vote])

    if context.vote
      redirect_to calendriers_pathcle
    end
  end
end
