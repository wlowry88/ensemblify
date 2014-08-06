class User < ActiveRecord::Base
	has_many :requests
	has_many :groups, through: :requests
	has_many :interests
	has_many :instrumentations, through: :interests
  has_many :groups, foreign_key: "admin_id"
  belongs_to :instrument
  before_update :check_for_instrument_and_zipcode

  def instrumentation_ids=(attributes)
    self.interests.destroy_all
    attributes.each do |id|
      if !id.empty?
        Interest.find_or_create_by(user_id: self.id, instrumentation_id: id)
      end
    end
  end

	def full_name
		"#{first_name} #{last_name}"
	end

  def member_of
    self.requests.collect do |request|
      request.group if request.finalized
    end.compact
  end

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image + "?type=large"
      user.email = auth.info.email
      user.gender = auth.extra.raw_info.gender
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end

  def check_for_instrument_and_zipcode
    !(instrument.nil? || zipcode.empty? || instrument.name.empty?)
  end

  def admin_of
    self.groups.where(:admin_id => self.id)
  end

  def group_ids_for_admin
    self.groups.where(:admin_id => self.id).collect{|group| group.id}
  end

  def pending_requests(user)
    array = group_ids_for_admin.map do |id|
      Request.where(group_id: id, user_id: user.id, finalized: nil)[0]
    end
    array.compact
  end

  def gender_pronoun
    if self.gender == 'female'
      "her"
    else
      "him"
    end
  end
end

