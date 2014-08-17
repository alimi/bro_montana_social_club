class PaymentsController < ApplicationController
  def new
    maybe_redirect_user

    @wepay_checkout_uri = WepayClient.get_checkout_uri_for_iframe_payment(
      Due.for_this_year.amount, 'Annual Dues', payment_url)
  end

  def create
    current_user.payments.create due: Due.for_this_year,
      wepay_checkout_id: params[:checkout_id]

    redirect_to root_path, notice: 'Thanks for paying your annual dues!'
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
