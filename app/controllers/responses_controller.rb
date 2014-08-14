class ResponsesController < SurveysController
  def create
    params[:questions].each do |question_id, response_params|
      question = Question.find(question_id)
      question.responses.create(
        choice_ids: response_params[:response][:choice_ids],
        user: current_user
      )
    end

    redirect_to root_path, notice: 'Thanks for completing the survey.'
  end
end
