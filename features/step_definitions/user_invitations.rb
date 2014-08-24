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
