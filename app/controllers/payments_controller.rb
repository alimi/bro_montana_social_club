class PaymentsController < ApplicationController
  def new
    @payment = Payment.new(questionaire: questionaire)
  end

  def create
    @payment = Payment.new(questionaire: questionaire)

    if @payment.process(params[:payment_method_id])
      redirect_to questionaire_path(questionaire)
    else
      @error = @payment.error
      render :new
    end
  end

  private

  def questionaire
    questionaire = Questionaire.find_by!(token: params[:questionaire_token])
  end
end
