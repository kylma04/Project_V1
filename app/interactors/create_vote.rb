class CreateVote
  include Interactor
  def call
    return unless vote_open?
    context.vote = Vote.create(voter: context.voter, status: context.status, vote_periode_id: vote_period.id)
  end

  private

  def vote_open?
    hour = Time.now.strftime("%l:%M %P")
    VotePeriode.is_vote_open?(hour)
  end

  def vote_period
    VotePeriode.first
  end
end