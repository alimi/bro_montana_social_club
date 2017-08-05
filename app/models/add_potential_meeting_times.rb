class AddPotentialMeetingTimes
  def next_task
  end

  def template
    "years/add_potential_meeting_times"
  end

  def template_data
    {
      potential_meeting_times: potential_meeting_times,
      new_potential_meeting_time: new_potential_meeting_time
    }
  end

  private

  def potential_meeting_times
    year.potential_meeting_times.sort.map do |time|
      time.in_time_zone(default_time_zone)
    end
  end

  def new_potential_meeting_time
    PotentialMeetingTime.new(
      month: current_time.month,
      day: current_time.day,
      year: current_time.year,
      hour: current_time.hour,
      time_zone: default_time_zone
    )
  end

  def current_time
    @current_time ||=
      Time.current.in_time_zone(default_time_zone).beginning_of_day
  end

  def default_time_zone
    PotentialMeetingTime::DEFAULT_TIME_ZONE
  end

  def year
    CurrentYear.find
  end
end
