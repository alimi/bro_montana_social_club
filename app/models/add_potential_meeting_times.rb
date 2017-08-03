class AddPotentialMeetingTimes
  def next_task
  end

  def template
    "years/add_potential_meeting_times"
  end

  def template_data
    {
      months: months,
      days: days,
      hours: hours,
      potential_meeting_times: potential_meeting_times
    }
  end

  private

  def potential_meeting_times
    year.potential_meeting_times.sort.map do |time|
      time.in_time_zone("Eastern Time (US & Canada)")
    end
  end

  def year
    CurrentYear.find
  end

  def months
    Date::MONTHNAMES.select(&:present?)
  end

  def days
    (1..31).to_a
  end

  def hours
    digits = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    am_hours = digits.map { |hour| "#{hour}:00 AM" }
    pm_hours = digits.map { |hour| "#{hour}:00 PM" }
    am_hours + pm_hours
  end
end
