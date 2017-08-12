class FundsController < ApplicationController
  include Authenticable

  def create
    year.funds.create!(fund_params)
    redirect_to year_path
  end

  def edit
    @fund = year.funds.find(params[:id])
  end

  def update
    fund = year.funds.find(params[:id])
    fund.update!(fund_params)
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
