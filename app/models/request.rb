class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def invite_message
  	"You have been invited to join #{self.group.name}!"
  end

  def invited?
    !user_approved && group_approved
  end

  def applied?
    user_approved && !group_approved
  end

  def finalize
  	if user_approved && group_approved
  		self.update_attributes(finalized: true)
  	elsif user_approved==false || group_approved==false
  		self.update_attributes(finalized: false)
  	end
  end

  def self.find_open_request_by_user_and_group(user, group)
    find_by(user_id: user.id, group_id: group.id, finalized: nil)
  end
end
