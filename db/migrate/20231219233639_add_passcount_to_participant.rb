class AddPasscountToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :pass_count, :integer, default: 0
  end
end
