class UserMailer < ActionMailer::Base
  default from: "ensemblify@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://google.com'
    mail(to: @user.email, subject: "#{@user.first_name}, welcome to Ensemblify!")
  end

  def invite_notification(user, group)
    @user = user
    @group = group
    @url = '/group/:id/show'
    mail(to: @user.email, subject: "#{@user.first_name}, you've been invited to join #{@group.name}.")
  end

  def request_notification(admin, user, group)
    @admin = admin
    @user = user
    @group = group
    @url = '/user/:id/show'
    mail(to: @admin.email, subject: "#{@admin.first_name}, #{@user.full_name} has requested to join #{@group.name}.")
  end

  def accept_invite(admin, user, group)
    @admin = admin
    @user = user
    @group = group
    @url = '/groups/:id/show'
    mail(to: @admin.email, subject: "#{@user.first_name} has accepted your invitation to join #{@group.name}.")
  end

  def accept_request(user, group)
    @user = user
    @group = group
    @url = '/users/:id/show'
    mail(to: @user.email, subject: "#{@group.name} has accepted your request to join.")
  end

  def contact_user(sender_name, sender_email, recipient_name, recipient_email, content)
    @content = content
    @sender_name = sender_name
    @sender_email = sender_email
    @recipient_name = recipient_name
    @recipient_email = recipient_email
    mail(to: recipient_email, subject: "#{sender_name} has sent you a message!", reply_to: @sender_email)
  end

end