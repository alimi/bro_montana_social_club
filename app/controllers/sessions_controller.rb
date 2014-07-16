class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      redirect_to survey_path
    else
      flash[:error] = 'Invalid username/password'
      render :new
    end
  end
end
