require "application_system_test_case"

class NewYearTest < ApplicationSystemTestCase
  test "a user can start a new year" do
    visit year_path
    click_link "Start New Year"
    assert_text "Review Members"
    click_link "Next"
    assert_text "Review Dues"
    click_link "Next"
    assert_text "Review Funds"
    click_link "Next"
  end
end
