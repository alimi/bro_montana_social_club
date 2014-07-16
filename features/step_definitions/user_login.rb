Given(/^there is a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Given(/^there is an active survery named "(.*?)"$/) do |name|
  Survey.create! name: name, active: true
end

When(/^I visit the login page$/) do
  visit new_session_path
end

When(/^I login as "(.*?)" with "(.*?)"$/) do |email, password|
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Login'
end

Then(/^I should see the currently active survery$/) do
  page.should have_content Survey.active.name
end

Then(/^I should see an invalid login error message$/) do
  page.should have_content 'Invalid username/password'
end
