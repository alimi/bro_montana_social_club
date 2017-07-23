class ReviewFunds
  def next_task
  end

  def template
    "years/review_funds"
  end

  def template_data
    { funds: Fund.order(:id) }
  end
end
