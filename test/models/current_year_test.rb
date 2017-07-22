require 'test_helper'

class CurrentYearTest < ActiveSupport::TestCase
  test "::find when there are multiple years" do
    past_year = Year.create!(calendar_year: 1987, next_task: StartYear.new)
    recent_year = Year.create!(calendar_year: 2017, next_task: StartYear.new)

    assert_equal recent_year, CurrentYear.find,
      "It returns the year with the most recent calendar year"
  end

  test "::find when no years exist" do
    assert_nil CurrentYear.find,
      "It returns nil"
  end
end
