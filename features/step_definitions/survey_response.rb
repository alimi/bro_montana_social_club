When(/^I answer "(.*?)" with "(.*?)"$/) do |question, choice|
  survey_question = Question.find_by_text(question)

  within "#question_#{survey_question.id}" do
    choose choice
  end
end

When(/^I submit the survey$/) do
  click_button 'Complete Survey'
end

Then(/^I should see a message that my response was submitted$/) do
  page.should have_content 'Thanks for completing the survey.'
end

When(/^"(.*?)" already completed the active survey$/) do |email|
  user = User.find_by_email(email)
  Survey.active.questions.each do |question|
    question.responses.create! user: user
  end
end

Then(/^I should be redirected to the home page$/) do
  page.should have_content 'Welcome Home'
end
