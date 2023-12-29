class RenameMissingDayColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :missing_days, :start, :start_date
    rename_column :missing_days, :end, :end_date
  end
end
