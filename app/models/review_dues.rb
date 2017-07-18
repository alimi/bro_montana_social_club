class ReviewDues
  def next_task
  end

  def template
    "years/review_dues"
  end

  def template_data
    { dues: dues }
  end

  private

  def dues
    Dues.new(amount_cents: year.dues_cents)
  end

  def year
    Year.order(calendar_year: :desc).first
  end
end
