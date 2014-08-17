class Due < ActiveRecord::Base
  def self.for_this_year
    where(year: Date.current.year).first
  end

  def self.any_for_this_year?
    where(year: Date.current.year).any?
  end
end
