class User < ActiveRecord::Base
  has_secure_password

  has_many :payments
  has_many :responses

  def completed_active_survey?
    return false if !responses.for_survey(Survey.active).any?
    Survey.active.questions.count == responses.for_survey(Survey.active).count
  end

  def paid_annual_dues?
    payments.joins(:due).where('dues.year = ?', Date.current.year).any?
  end
end
