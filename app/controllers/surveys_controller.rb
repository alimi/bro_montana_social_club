class SurveysController < ApplicationController
  before_action :allow_if_incomplete_active_survey

  def show
    @survey = Survey.active
  end

  private

  def allow_if_incomplete_active_survey
    return if !current_user.completed_active_survey?

    redirect_to root_path, notice:
      "Thanks for completing this year's survey. " +
      "The results will be back shortly."
  end
end
