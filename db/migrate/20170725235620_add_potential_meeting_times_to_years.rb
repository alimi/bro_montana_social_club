class AddPotentialMeetingTimesToYears < ActiveRecord::Migration[5.1]
  def change
    add_column :years, :potential_meeting_times, :datetime, array: true
  end
end
