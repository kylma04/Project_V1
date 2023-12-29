class CreatecleanCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks_calendars do |t|
      t.date :date_cleaning_task, null: false

      t.timestamps
    end
  end
end
