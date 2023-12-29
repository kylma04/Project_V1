class ChangeDateToTimeVotePeriod < ActiveRecord::Migration[7.1]
  def change
    rename_column :vote_periodes, :periode_begin, :temp_periode_begin
    add_column :vote_periodes, :periode_begin, :time
    remove_column :vote_periodes, :temp_periode_begin

    rename_column :vote_periodes, :periode_end, :temp_periode_end
    add_column :vote_periodes, :periode_end, :time
    remove_column :vote_periodes, :temp_periode_end
  end
end
