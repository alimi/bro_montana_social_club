When(/^I visit the homepage$/) do
  visit root_path
end

Then(/^I should see the survey page for the active survey$/) do
  page.should have_selector 'h1', text: Survey.active.name
end

Given(/^"(.*?)" has completed the active survey$/) do |email|
  user = User.find_by_email(email)

  if Survey.active.questions.count == 0
    question = Survey.active.questions.create!
    question.responses.create! user: user
  end
end

Then(/^I should see the homepage$/) do
  page.should have_content 'Welcome Home!'
end
