When(/^I visit a page that requires authentication$/) do
  visit survey_path
end

Then(/^I should see an unauthorized message$/) do
  expect(page).to have_content('This page is for members only')
end
