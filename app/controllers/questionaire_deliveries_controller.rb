class QuestionaireDeliveriesController < ApplicationController
  def create
    questionaire = Questionaire.find(params[:questionaire_id])
    QuestionaireDeliveryJob.perform_later(questionaire)
    redirect_to year_path
  end
end
