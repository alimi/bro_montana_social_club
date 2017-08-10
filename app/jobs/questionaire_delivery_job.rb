class QuestionaireDeliveryJob < ApplicationJob
  queue_as :default

  def perform(questionaire)
    email = email_for(questionaire)
    email.deliver
    questionaire.update(delivered_at: DateTime.current)
  end

  private

  def email_for(questionaire)
    if questionaire.unstarted?
      QuestionaireMailer.new_email(questionaire)
    elsif !questionaire.completed?
      QuestionaireMailer.reminder_email(questionaire)
    end
  end
end
