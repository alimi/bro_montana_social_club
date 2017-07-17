require 'test_helper'

class YearTest < ActiveSupport::TestCase
  test "#next_task= given a known task" do
    year = Year.new(next_task: StartYear.new)

    assert_equal "StartYear", year.read_attribute(:next_task),
      "It assigns the next task's class as next_task"
  end

  test "#next_task= given an unknown task" do
    year = Year.new(next_task: String.new)

    assert_not year.valid?, "It marks the year as invalid"
  end

  test "#next_task when the year has a next task" do
    year = Year.new(next_task: StartYear.new)

    assert_instance_of StartYear, year.next_task,
      "It returns a new instance of the task"
  end

  test "#next_task when the year doesn't have a next task" do
    year = Year.new

    assert_nil year.next_task,
      "It returns nil"
  end

  test "valid? when a year with the calendar year already exists" do
    another_year = Year.create!(
      calendar_year: 1984,
      next_task: StartYear.new
    )

    year = Year.new(calendar_year: 1984)

    year.valid?

    assert year.errors[:calendar_year].present?,
      "It adds an error on calendar year"
  end
end
