class ResponsesController < SurveysController
  def create
    params[:questions].each do |question_id, response_params|
      question = Question.find(question_id)
      question.responses.create(
        choice_ids: response_params[:response][:choice_ids],
        user: current_user
      )
    end

    flash[:notice] = 'Thanks for completing the survey.'

    if !current_user.paid_annual_dues? && Due.any_for_this_year?
      redirect_to new_payment_path
    else
      redirect_to root_path
    end
  end
end
