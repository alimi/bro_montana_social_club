Then(/^I should see the survey page for the active survey$/) do
  expect(page).to have_selector('h1', text: Survey.active.name)
end

Then(/^I should see the homepage$/) do
  expect(page).to have_content('Welcome Home!')
end

Then(/^I should see the currently active survey$/) do
  expect(page).to have_content(Survey.active.name)
end
