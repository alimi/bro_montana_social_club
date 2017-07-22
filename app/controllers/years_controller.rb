class YearsController < ApplicationController
  def show
    year = current_year || new_year
    next_task = year.next_task
    render next_task.template, locals: next_task.template_data
  end

  def create
    YearNavigator.new(year: new_year).progress
    redirect_to year_path
  end

  def update
    YearNavigator.new(year: current_year).progress
    redirect_to year_path
  end

  private

  def current_year
    CurrentYear.find
  end

  def new_year
    Year.new(
      next_task: StartYear.new,
      calendar_year: Date.current.year
    )
  end
end
