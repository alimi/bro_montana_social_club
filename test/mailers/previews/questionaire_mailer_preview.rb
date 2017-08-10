# Preview all emails at http://localhost:3000/rails/mailers/questionaire_mailer
class QuestionaireMailerPreview < ActionMailer::Preview
  def new_email
    QuestionaireMailer.new_email(questionaire)
  end

  def reminder_email
    QuestionaireMailer.reminder_email(questionaire)
  end

  private

  def questionaire
    Questionaire.new(
      year: year,
      token: "42",
      member: member
    )
  end

  def member
    Member.new(name: "Deltron", email: "del@thafunkyhomosapien.co")
  end

  def year
    Year.new(calendar_year: 3030)
  end
end
