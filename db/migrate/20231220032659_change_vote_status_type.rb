class ChangeVoteStatusType < ActiveRecord::Migration[7.1]
  def change
    rename_column :votes, :status, :temp_status
      add_column :votes, :status, :integer
      remove_column :votes, :temp_status
  end
end
