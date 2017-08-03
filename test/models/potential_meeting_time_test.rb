require 'test_helper'

class PotentialMeetingTimeTest < ActiveSupport::TestCase
  test "#time_zone=" do
    potential_meeting_time = PotentialMeetingTime.new
    potential_meeting_time.time_zone = "Eastern Time (US & Canada)"

    assert_equal(
      ActiveSupport::TimeZone.new("Eastern Time (US & Canada)"),
      potential_meeting_time.time_zone,
      "It converts the time zone string to the ActiveSupport::TimeZone object"
    )
  end

  test "#to_time" do
    potential_meeting_time = PotentialMeetingTime.new(
      month: "October",
      day: 22,
      year: 2017,
      starting_at: "12:00 PM",
      time_zone: "Eastern Time (US & Canada)"
    )

    time_zone = ActiveSupport::TimeZone.new("Eastern Time (US & Canada)")

    assert_equal(
      time_zone.local(2017, 10, 22, 12),
      potential_meeting_time.to_time,
      "It returns the potential meeting time as a time object"
    )
  end
end
