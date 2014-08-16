class Due < ActiveRecord::Base
  scope :for_this_year, -> { where(year: Date.current.year) }
end
