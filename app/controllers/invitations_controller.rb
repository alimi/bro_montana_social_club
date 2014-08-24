class InvitationsController < ApplicationController
  skip_before_filter :authorize

  def show
    @invitation = Invitation.find_by_token(params[:token])
    @user = @invitation.user
  end

  def update
    @invitation = Invitation.find(params[:id])
    @user = @invitation.user

    if @user.update_attributes(user_params)
      @invitation.update_attributes(expired_at: DateTime.current)
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join('; ')
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
