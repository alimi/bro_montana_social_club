When(/^"(.*?)" already completed the active survey$/) do |email|
  user = User.find_by_email(email)

  if Survey.active.questions.any?
    Survey.active.questions.each do |question|
      question.responses.create! user: user
    end
  else
    question = Survey.active.questions.create!
    question.responses.create! user: user
  end
end
