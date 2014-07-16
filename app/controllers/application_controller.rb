class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authorize

  private

  def authorize
    return if current_user

    flash[:warning] = 'This page is for members only'
    redirect_to request.env["HTTP_REFERER"] || root_path
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
