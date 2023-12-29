class AddPunishToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :punish, :boolean, default: false
    add_column :participants, :punish_at, :date
  end
end
