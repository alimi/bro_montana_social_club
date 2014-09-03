class ResponsesController < SurveysController
  def create
    params[:questions].each do |question_id, response_params|
      question = Question.find(question_id)

      choice_ids = sanitize_response_params_choice_ids(
        response_params[:response][:choice_ids]
      )

      if choice_ids.any?
        question.responses.create(
          choice_ids: response_params[:response][:choice_ids],
          user: current_user
        )
      end
    end


    if current_user.completed_active_survey?
      flash[:notice] = 'Thanks for completing the survey.'
      redirect_to new_payment_path
    else
      current_user.responses.for_survey(Survey.active).destroy_all
      redirect_to survey_path, notice: "Looks like you didn't answer all the " +
        'questions. Please try again.'
    end
  end

  private

  def sanitize_response_params_choice_ids(choice_ids)
    return [choice_ids] if !choice_ids.is_a?(Array)
    choice_ids.reject { |choice_id| choice_id == '' }
  end
end
