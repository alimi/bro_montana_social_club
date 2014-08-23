class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :selections, dependent: :delete_all
  has_many :choices, through: :selections

  scope :for_active_survey_fund_contribution_questions, -> {
    for_fund_contribution_questions.for_survey(Survey.active)
  }

  scope :for_fund_contribution_questions, -> {
    joins(:question).where('questions.about_fund_contributions = true')
  }

  scope :for_survey, ->(survey) {
    joins(:question).where('questions.survey_id = :survey', survey: survey)
  }
end
