class QuestionairesController < ApplicationController
  include Authenticable

  def show
    if questionaire.completed?
      render "questionaires/complete"
    else
      render :show
    end
  end

  def update
    questionaire.update!(
      questionaire_params.merge(completed_at: DateTime.current)
    )

    redirect_to new_questionaire_payment_path(questionaire)
  end

  private

  def questionaire
    @questionaire ||= Questionaire.find_by!(token: params[:token])
  end

  def questionaire_params
    params.
      require(:questionaire).
      permit(available_meeting_times: [], contributing_fund_ids: []).
      transform_values { |value_array| value_array.reject(&:blank?) }
  end
end
