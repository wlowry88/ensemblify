class User < ActiveRecord::Base
	has_many :requests
	has_many :groups, through: :requests
	has_many :interests
	has_many :instrumentations, through: :interests
  before_update :registered?

  def interests_attributes=(attributes)
    ##{"0"=>{"instrumentation_id"=>["1", "2", ""]}}
    attributes["0"]["instrumentation_id"].each do |id|
      if !id.empty?
        Interest.create(user_id: self.id, instrumentation_id: id)
      end
    end
  end

	def full_name
		"#{first_name} #{last_name}"
	end

  def profile_attributes
    hash=self.attributes.select do |attribute, value|
      !["uid", "provider", "oauth_token", "oauth_expires_at", "created_at", "updated_at", "id","image"].include?(attribute)
    end
    new_hash = {}
    hash.each do |attribute, value|
      if (value.is_a? Integer) || !(value.nil? || value.empty?)
        new_hash[attribute.split("_").map(&:capitalize).join(' ')] = value
      end
    end
    new_hash
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

  def self.instrument_list
    ["violin", "viola", "cello", "bass", "harp", "guitar", "flute", "clarinet", "oboe", "bassoon", "french horn", "trumpet", "trombone", "tuba", "piano", "voice", "percussion", "saxophone"]
  end

  def registered?
    !(instrument.nil? || zipcode.nil?)
  end

  def admin_of
    self.groups.where(:admin => self.id)
  end

end

