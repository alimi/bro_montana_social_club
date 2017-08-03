class PotentialMeetingTimesController < ApplicationController
  def create
    potential_meeting_time = PotentialMeetingTime.
      new(potential_meeting_time_params)

    year.potential_meeting_times << potential_meeting_time.to_time

    year.save!

    redirect_to year_path
  end

  private

  def potential_meeting_time_params
    params.
      require(:potential_meeting_time).
      permit(:month, :day, :starting_at, :time_zone).
      merge(year: year.calendar_year)
  end

  def year
    @year ||= CurrentYear.find
  end
end
