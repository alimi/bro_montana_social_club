class AddDefaultToYearsPotentialMeetingTimes < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:years, :potential_meeting_times, from: nil, to: [])
  end
end
