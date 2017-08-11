class PotentialMeetingTime
  include ActiveModel::Model

  DEFAULT_TIME_ZONE = "Eastern Time (US & Canada)"

  attr_accessor :month, :day, :year, :hour, :time_zone

  def self.from_id(id)
    time = Time.at(id).in_time_zone(DEFAULT_TIME_ZONE)

    PotentialMeetingTime.new(
      month: time.month,
      day: time.day,
      year: time.year,
      hour: time.hour,
      time_zone: DEFAULT_TIME_ZONE
    )
  end

  def id
    to_time.to_i
  end

  def to_s
    to_time.strftime("%A, %B %e at %l:00 %p")
  end

  def to_time
    ActiveSupport::TimeZone.new(time_zone).local(year, month, day, hour)
  end
end
