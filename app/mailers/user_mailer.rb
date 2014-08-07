class UserMailer < ActionMailer::Base
  default from: "ccmeyers@gmail.com"

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
  
end