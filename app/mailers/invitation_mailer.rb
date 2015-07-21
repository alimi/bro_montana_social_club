class InvitationMailer < ActionMailer::Base
  default from: 'do-not-reply@bromontana.herokuapp.com'

  def invitation_email(user)
    @user = user
    invitation = user.invitation || user.create_invitation
    @invitation_link = invitations_url(token: invitation.token)

    mail(
      to: @user.email,
      subject: "You've Been Invited to Join Bro Montana Social Club"
    )
  end
end
