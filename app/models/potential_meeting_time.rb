class PotentialMeetingTime
  include ActiveModel::Model

  attr_accessor :month, :day, :year, :starting_at, :time_zone

  def time_zone=(new_time_zone_name)
    @time_zone = ActiveSupport::TimeZone.new(new_time_zone_name)
  end

  def to_time
    time_zone.parse("#{month} #{day}, #{year} #{starting_at}")
  end
end
