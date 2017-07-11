class ReviewMembers
  def next_task
    ReviewDues.new
  end

  def template
    "years/review_members"
  end

  def template_data
    { members: Member.all }
  end
end
