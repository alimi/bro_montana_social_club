class Survey < ActiveRecord::Base
  def self.active
    Survey.where(active: true).first
  end
end
