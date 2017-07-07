class YearNavigator
  attr_reader :year, :current_task

  def initialize(year:)
    @year = year
    @current_task = year.next_task
  end

  def progress
    year.update!(next_task: current_task.next_task)
    year.next_task
  end
end
