Given(/^the active survey has a question "(.*?)" with the choices "(.*?)"$/) do |question, choices|
  survey_question = Survey.active.questions.create! text: question

  choices.split(',').each do |choice|
    survey_question.choices.create! text: choice
  end
end

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
