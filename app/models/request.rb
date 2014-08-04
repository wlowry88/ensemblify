class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def invite_message
  	"You have been invited to join #{self.group.name}!"
  end

  def finalize
  	if user_approved && group_approved
  		self.update_attributes(finalized: true)
  	elsif user_approved==false || group_approved==false
  		self.update_attributes(finalized: false)
  	end
  end
end
