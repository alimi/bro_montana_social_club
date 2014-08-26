Given(/^there is an invitation for "(.*?)"$/) do |email|
  user = User.new email: email
  user.save(validate: false)
  user.create_invitation!
end

When(/^I follow the invitation link sent to "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  visit invitations_path(token: user.invitation.token)
end

When(/^I fill out my user information$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Submit'
end

When(/^I enter invalid user information$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'invalid'
  click_button 'Submit'
end

Then(/^I should see the invitation page$/) do
  expect(page).to have_selector('form.edit_invitation')
end

Given(/^the invitation for "(.*?)" is expired$/) do |email|
  user = User.find_by_email(email)
  user.invitation.update_attributes(expired_at: 1.day.ago)
end

Then(/^I should see an expired invitation message$/) do
  expect(page).to have_content('expired')
end

Given(/^the invitation for "(.*?)" has been accepted$/) do |email|
  user = User.find_by_email(email)
  user.invitation.update_attributes(expired_at: 1.day.ago)
end
