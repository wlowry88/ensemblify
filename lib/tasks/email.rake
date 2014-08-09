desc 'Email'
task :send_will_emails => :environment do
  
  UserMailer.request_notification(User.first, User.first, Group.first).deliver
end