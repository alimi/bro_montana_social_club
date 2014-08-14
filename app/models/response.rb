class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :selections, dependent: :delete_all
  has_many :choices, through: :selections

  scope :for_survey, ->(survey) {
    joins(:question).where('questions.survey_id = :survey', survey: survey)
  }
end
