class QuestionairesController < ApplicationController
  def show
    @questionaire = Questionaire.find_by!(token: params[:token])
  end

  def update
    questionaire = Questionaire.find_by!(token: params[:token])
    questionaire.update!(
      questionaire_params.merge(completed_at: DateTime.current)
    )

    redirect_to action: :show
  end

  private

  def questionaire_params
    params.
      require(:questionaire).
      permit(available_meeting_times: [], contributing_fund_ids: []).
      transform_values { |value_array| value_array.reject(&:blank?) }
  end
end
