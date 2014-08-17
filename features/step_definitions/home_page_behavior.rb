When(/^I visit the homepage$/) do
  visit root_path
end

Given(/^"(.*?)" has completed the active survey$/) do |email|
  user = User.find_by_email(email)

  if Survey.active.questions.count == 0
    question = Survey.active.questions.create!
    question.responses.create! user: user
  end
end
