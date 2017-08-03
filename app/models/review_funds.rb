class ReviewFunds
  def next_task
    AddPotentialMeetingTimes.new
  end

  def template
    "years/review_funds"
  end

  def template_data
    { funds: year.funds.order(:id) }
  end

  private

  def year
    CurrentYear.find
  end
end
