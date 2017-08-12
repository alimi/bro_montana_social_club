class PaymentsController < ApplicationController
  def new
    @payment = Payment.new(questionaire: questionaire)
  end

  def create
    questionaire.update!(
      paid_at: DateTime.current,
      payment_token: params[:checkout_id]
    )

    render "questionaires/complete"
  end

  private

  def questionaire
    questionaire = Questionaire.find_by!(token: params[:questionaire_token])
  end
end
