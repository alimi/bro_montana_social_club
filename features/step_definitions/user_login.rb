Given(/^there is a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Then(/^I should see the currently active survery$/) do
  page.should have_content Survey.active.name
end

Then(/^I should see an invalid login error message$/) do
  page.should have_content 'Invalid username/password'
end
