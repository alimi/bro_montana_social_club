class User < ActiveRecord::Base
  has_secure_password

  has_one :invitation

  has_many :payments
  has_many :responses

  def completed_active_survey?
    return false if !responses.for_survey(Survey.active).any?
    Survey.active.questions.count == responses.for_survey(Survey.active).count
  end

  def paid_annual_dues?
    payments.joins(:due).where('dues.year = ?', Date.current.year).any?
  end

  def amount_of_annual_fund_contributions
    return 0 if !responses.for_active_survey_fund_contribution_questions.any?

    responses.
      for_active_survey_fund_contribution_questions.
      first.
      choices.
      map { |choice| choice.value }.
      reduce { |sum, value| sum + value }
  end
end
