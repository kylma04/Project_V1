require 'sidekiq-scheduler'
class CalculVote
  include Interactor
  def call
    context.task.update(task_final_note: calcul_summary)
  end
  
  private

  def get_admins_vote
    Vote.where(created_at: Date.today, voter_type: "Administrator")
  end

  def get_participants_vote
    Vote.where(created_at: Date.today, voter_type: "Participant")
  end

  def calcul_vote
    count_participants = get_participants_vote.sum(0) { |vote| vote.status ? vote.status : 0 }
    count_admins =  get_admins_vote.sum(0) { |vote| vote.status ? vote.status * 2 : 0 }
    count_participants + count_admins
  end

  def calcul_summary
    (calcul_vote / (get_admins_vote.count + get_participants_vote.count * 2)) * 100
  end

end