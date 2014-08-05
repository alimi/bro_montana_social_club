class Response < ActiveRecord::Base
  belongs_to :choice
  belongs_to :question
  belongs_to :user

  scope :for_survey, ->(survey) {
    joins(:question).where('questions.survey_id = :survey', survey: survey)
  }
end
