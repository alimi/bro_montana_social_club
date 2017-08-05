class PotentialMeetingTimesController < ApplicationController
  def create
    potential_meeting_time = PotentialMeetingTime.
      new(potential_meeting_time_params)

    year.potential_meeting_times << potential_meeting_time.to_time

    year.save!

    redirect_to year_path
  end

  def edit
    @potential_meeting_time = PotentialMeetingTime.from_id(params[:id].to_i)
  end

  def update
    old_time = Time.at(params[:id].to_i)
    new_time = PotentialMeetingTime.new(potential_meeting_time_params).to_time
    new_times = year.potential_meeting_times - [old_time] + [new_time]
    year.update!(potential_meeting_times: new_times)
    redirect_to year_path
  end

  private

  def potential_meeting_time_params
    params.
      require(:potential_meeting_time).
      permit(:month, :day, :hour, :time_zone).
      merge(year: year.calendar_year)
  end

  def year
    @year ||= CurrentYear.find
  end
end
