class Questionaire < ApplicationRecord
  belongs_to :year
  belongs_to :member

  delegate :name, :email, to: :member, prefix: true
  delegate :calendar_year, to: :year
  delegate :funds, to: :year
  delegate :dues_cents, to: :year

  def current_status
    statuses.find { |status| status.current }
  end

  def unstarted?
    !delivered? && !completed?
  end

  def delivered?
    delivered_at.present? && !completed?
  end

  def completed?
    completed_at.present? && paid_at.present?
  end

  def fund_contribution_cents
    Fund.where(id: contributing_fund_ids).sum(:contribution_amount_cents)
  end

  def potential_meeting_times
    year.potential_meeting_times.sort.map do |time|
      PotentialMeetingTime.from_id(time.to_i)
    end
  end

  def to_param
    token
  end

  private

  def statuses
    [
      Status.new("not delivered", nil, unstarted?),
      Status.new("delivered", delivered_at, delivered?),
      Status.new("completed", completed_at, completed?)
    ]
  end

  Status = Struct.new(:name, :time, :current) do
    def to_s
      if time.present?
        "#{name.capitalize} at #{time}"
      else
        "#{name.capitalize}"
      end
    end
  end
end
