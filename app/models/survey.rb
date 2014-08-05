class Survey < ActiveRecord::Base
  has_many :questions

  def self.active
    Survey.where(active: true).first
  end
end
