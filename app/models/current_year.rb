class CurrentYear
  def self.find
    Year.order(calendar_year: :desc).first
  end
end
