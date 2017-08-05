require 'test_helper'

class PotentialMeetingTimeTest < ActiveSupport::TestCase
  test "::from_id" do
    potential_meeting_time = PotentialMeetingTime.new(
      month: 10,
      day: 22,
      year: 2017,
      hour: 14,
      time_zone: PotentialMeetingTime::DEFAULT_TIME_ZONE
    )

    id = potential_meeting_time.id

    potential_meeting_time_from_id = PotentialMeetingTime.from_id(id)

    assert_equal potential_meeting_time.id, potential_meeting_time_from_id.id,
      "It returns the potential meeting time for the id"
  end

  test "#id" do
    time_zone = PotentialMeetingTime::DEFAULT_TIME_ZONE

    potential_meeting_time = PotentialMeetingTime.new(
      month: 10,
      day: 22,
      year: 2017,
      hour: 7,
      time_zone: time_zone
    )

    expected_id = Time.new(2017, 10, 22, 7).in_time_zone(time_zone).to_i

    assert_equal expected_id, potential_meeting_time.id,
      "It returns the potential meeting time's as an integer"
  end

  test "#to_time" do
    time_zone = PotentialMeetingTime::DEFAULT_TIME_ZONE

    potential_meeting_time = PotentialMeetingTime.new(
      month: 10,
      day: 22,
      year: 2017,
      hour: 14,
      time_zone: time_zone
    )

    assert_equal(
      Time.new(2017, 10, 22, 14).in_time_zone(time_zone),
      potential_meeting_time.to_time,
      "It returns the potential meeting time as a time object in the time zone"
    )
  end
end
