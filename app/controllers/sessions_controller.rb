class SessionsController < ApplicationController
  include SessionManagement

  skip_before_action :authorize

  before_action :allow_if_no_current_user

  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      login(user)
      redirect_to survey_path
    else
      flash[:error] = 'Invalid email/password'
      render :new
    end
  end

  private

  def allow_if_no_current_user
    return if current_user.blank?

    redirect_to root_path
  end
end
