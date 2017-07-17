require 'test_helper'

class YearNavigatorTest < ActiveSupport::TestCase
  test "#progress" do
    year = Year.new(next_task: StartYear.new)

    YearNavigator.new(year: year).progress

    assert_equal StartYear.new.next_task.class, year.next_task.class,
      "It saves the current task's next task on the year"
  end
end
