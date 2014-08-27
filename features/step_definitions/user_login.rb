Given(/^there is a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  User.create!(email: email, password: password, password_confirmation: password)
end

Then(/^I should see an invalid login error message$/) do
  expect(page).to have_content('Invalid username/password')
end
