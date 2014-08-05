When(/^I login as "(.*?)" with "(.*?)"$/) do |email, password|
  visit new_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Login'
end
