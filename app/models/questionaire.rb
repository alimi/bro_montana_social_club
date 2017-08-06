class Questionaire < ApplicationRecord
  belongs_to :year
  belongs_to :member

  delegate :name, to: :member, prefix: true

  def current_status
    statuses.find { |status| status.current }
  end

  private

  def statuses
    [
      Status.new("not delivered", nil, unstarted?),
      Status.new("delivered", delivered_at, delivered?),
      Status.new("completed", completed_at, completed?)
    ]
  end

  def unstarted?
    !delivered? && !completed?
  end

  def delivered?
    delivered_at.present? && !completed?
  end

  def completed?
    completed_at.present?
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
