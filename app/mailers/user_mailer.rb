class UserMailer < ActionMailer::Base
  default from: "ensemblify@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "ensemblify.com"
    mail(to: @user.email, subject: "#{@user.first_name}, welcome to Ensemblify!")
  end

  def invite_notification(user, group)
    @user = user
    @group = group
    if user.logged_in?
      @url = "ensemblify.com/groups/#{@group.id}"
    else
      @url = "ensemblify.com"
    end
    mail(to: @user.email, subject: "#{@user.first_name}, you've been invited to join #{@group.name}.")
  end

  def request_notification(admin, user, group)
    @admin = admin
    @user = user
    @group = group
    if user.logged_in?
      @group_url = "ensemblify.com/groups/#{@group.id}"
      @user_url = "ensemblify.com/users/#{@user.id}"
    else
      @group_url = "ensemblify.com"
      @user_url = "ensemblify.com"
    end
    mail(to: @admin.email, subject: "#{@admin.first_name}, #{@user.full_name} has requested to join #{@group.name}.")
  end

  def accept_invite(admin, user, group)
    @admin = admin
    @user = user
    @group = group
    if user.logged_in?
      @user_url = "ensemblify.com/users/#{@user.id}"
      @group_url = "ensemblify.com/groups/#{@group.id}"
    else
      @user_url = "ensemblify.com"
      @group_url = "ensemblify.com"
    end
    mail(to: @admin.email, subject: "#{@user.first_name} has accepted your invitation to join #{@group.name}.")
  end

  def accept_request(user, group)
    @user = user
    @group = group
    if logged_in?
      @url = "ensemblify.com/groups/#{@group.id}"
    else
      @url = "ensemblify.com"
    end
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