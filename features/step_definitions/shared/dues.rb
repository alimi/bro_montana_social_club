Given(/^there is a due for this year of \$"(.*?)"$/) do |amount|
  Due.create! year: Date.current.year, amount: amount
end

When(/^"(.*?)" has not paid annual dues$/) do |email|
  # Nothing to do because the user will not have a payment for current dues
end

When(/^"(.*?)" has paid annual dues$/) do |email|
  user = User.find_by_email(email)
  due = Due.find_or_create_by(year: Date.current.year)
  user.payments.create! due: due
end

Then(/^I should see the payment page$/) do
  expect(page).to have_selector('h1', text: 'Dues')
end
