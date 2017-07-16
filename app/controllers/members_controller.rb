class MembersController < ApplicationController
  def create
    Member.create!(member_params)
    redirect_to year_path
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update!(member_params)
    redirect_to year_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end
end
