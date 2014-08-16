Given(/^there is an active survey named "(.*?)"$/) do |name|
  Survey.create! name: name, active: true
end

Given(/^the active survey has a question "(.*?)" with the choices "(.*?)"$/) do |question, choices|
  survey_question = Survey.active.questions.create! text: question

  choices.split(',').each do |choice|
    survey_question.choices.create! text: choice
  end
end
