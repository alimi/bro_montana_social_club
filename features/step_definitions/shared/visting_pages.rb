Then(/^I should see the survey page for the active survey$/) do
  page.should have_selector 'h1', text: Survey.active.name
end

Then(/^I should see the homepage$/) do
  page.should have_content 'Welcome Home!'
end
