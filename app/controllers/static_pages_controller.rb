class StaticPagesController < ApplicationController
  skip_before_filter :authorize

  def home
    maybe_redirect_current_user
  end

  private

  def maybe_redirect_current_user
    return if current_user.blank?

    if !current_user.completed_active_survey?
      redirect_to survey_path
    elsif !current_user.paid_annual_dues?
      redirect_to new_payment_path
    end
  end
end
