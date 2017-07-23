class FundsController < ApplicationController
  def create
    year.funds.create!(fund_params)
    redirect_to year_path
  end

  private

  def year
    CurrentYear.find
  end

  def fund_params
    params.require(:fund).permit(:name, :contribution_amount_dollars)
  end
end
