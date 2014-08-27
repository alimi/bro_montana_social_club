class SurveysController < ApplicationController
  include SessionManagement

  def show
    if !current_user.completed_active_survey?
      @survey = Survey.active
    else
      redirect_home_or_to_payment
    end
  end

  private

  def redirect_home_or_to_payment
    if current_user.paid_annual_dues?
      log_out

      redirect_to root_path, notice:
        "Thanks for completing this year's survey. " +
        "You've now been logged out."
    else
      redirect_to new_payment_path
    end
  end
end
