class RemoveStartAndEndDateToMissingDays < ActiveRecord::Migration[7.1]
  def change
    remove_column :missing_days, :start_date
    remove_column :missing_days, :end_date
  end
end
