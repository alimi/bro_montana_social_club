class DuesController < ApplicationController
  def edit
    @dues = Dues.new(amount_cents: year.dues_cents)
  end

  def update
    dues = Dues.new(dues_params)
    year.update!(dues_cents: dues.amount_cents)
    redirect_to year_path
  end

  private

  def dues_params
    params.require(:dues).permit(:amount_dollars)
  end

  def year
    Year.order(calendar_year: :desc).first
  end
end
