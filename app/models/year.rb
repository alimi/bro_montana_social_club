class Year < ApplicationRecord
  validates :calendar_year, uniqueness: true
  validate :next_task_is_known

  has_many :funds
  has_many :questionaires

  def next_task=(new_task)
    super(new_task.class)
  end

  def next_task
    type = read_attribute(:next_task)
    type && type.constantize.new
  end

  private

  def next_task_is_known
    if known_task_classes.exclude?(next_task.class)
      errors.add(:next_task, "is not a known task")
    end
  end

  def known_task_classes
    [
      ReviewDues,
      ReviewMembers,
      StartYear,
      ReviewFunds,
      AddPotentialMeetingTimes,
      ManageQuestionaires
    ]
  end
end
