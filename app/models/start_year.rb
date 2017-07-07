class StartYear
  def next_task
    ReviewMembers.new
  end

  def template
    "years/start_year"
  end

  def template_data
  end
end
