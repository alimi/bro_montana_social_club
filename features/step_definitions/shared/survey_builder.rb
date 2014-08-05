Given(/^there is an active survey named "(.*?)"$/) do |name|
  Survey.create! name: name, active: true
end
