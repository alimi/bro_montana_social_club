class QuestionaireMailer < ApplicationMailer
  def new_email(questionaire)
    @questionaire = questionaire

    mail(
      to: questionaire.member_email,
      subject: "The #{questionaire.calendar_year} Bro Montana Social Club Questionaire"
    )
  end

  def reminder_email(questionaire)
    @questionaire = questionaire

    mail(
      to: questionaire.member_email,
      subject: "REMINDER! The #{questionaire.calendar_year} Bro Montana Social Club Questionaire"
    )
  end
end
