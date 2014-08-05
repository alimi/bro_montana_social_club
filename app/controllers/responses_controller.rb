class ResponsesController < SurveysController
  def create
    params[:questions].each do |question_id, response_params|
      question = Question.find(question_id)
      question.responses.create(
        choice: question.choices.find(response_params[:response][:choice_id]),
        user: current_user
      )
    end

    redirect_to root_path, notice: 'Thanks for completing the survey.'
  end
end
