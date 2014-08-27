class PaymentsController < ApplicationController
  include SessionManagement

  def new
    maybe_redirect_user

    @annual_dues = Due.for_this_year.amount
    @fund_contributions = current_user.amount_of_annual_fund_contributions
    @total_due = @annual_dues + @fund_contributions

    @wepay_checkout_uri = WepayClient.get_checkout_uri_for_iframe_payment(
      @total_due,
      'Annual Dues and Fund Contributions',
      payments_url
    )
  end

  def create
    current_user.payments.create due: Due.for_this_year,
      wepay_checkout_id: params[:checkout_id]

    log_out

    redirect_to root_path, notice: 'Thanks for paying your annual dues! ' +
      "You've now been logged out."
  end

  private

  def maybe_redirect_user
    if !current_user.completed_active_survey?
      redirect_to survey_path
    elsif current_user.paid_annual_dues?
      redirect_to root_path
    end
  end
end
