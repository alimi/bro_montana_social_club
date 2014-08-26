class InvitationsController < ApplicationController
  skip_before_filter :authorize

  def show
    @invitation = Invitation.find_by_token(params[:token])
    redirect_if_invitation_cannot_be_processed

    @user = @invitation.user
  end

  def update
    @invitation = Invitation.find(params[:id])
    @user = @invitation.user

    if @user.update_attributes(user_params)
      @invitation.update_attributes(expired_at: DateTime.current)
      flash.clear
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages.join('; ')
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def redirect_if_invitation_cannot_be_processed
    if @invitation.blank?
      flash[:notice] = 'Please use a valid invitation.'
      redirect_to root_path
    elsif @invitation.accepted?
      redirect_to root_path
    elsif @invitation.expired?
      flash[:notice] = 'This invitation is expired. ' +
        'Contact the site admin for further instructions.'
      redirect_to root_path
    end
  end
end
