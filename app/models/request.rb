class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def invite_message
  	"You have been invited to join #{self.group.name}!"
  end
end
