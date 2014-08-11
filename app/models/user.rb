class User < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  has_many :requests
  has_many :groups, through: :requests
  has_many :interests
  has_many :instrumentations, through: :interests
  has_many :groups, foreign_key: "admin_id"
  belongs_to :instrument
  before_update :check_for_instrument_and_zipcode
  geocoded_by :zipcode
  after_validation :geocode
  before_update :geocode, :validate_zipcode
  before_destroy :destroy_admin_of


  def eligible_groups(user)
    all_admins_groups = (self.admin_of - user.member_of)

    correct = []

    Request.where(user_id: user.id, finalized: nil).collect do |row|
      if row.group
        correct << row if row.group.admin_id == self.id
      end
    end

    correct_groups = correct.collect {|request| request.group }

    all_admins_groups - correct_groups

  end

  def already_invited(user)
    all_admins_groups = (self.admin_of - user.member_of)

       correct = []

      Request.where(user_id: user.id, finalized: nil).collect do |row|
        if row.group
         correct << row if row.group.admin_id == self.id
        end
      end


       correct_groups = correct.collect {|request| request.group }
       final = all_admins_groups.collect do |group|
         if correct_groups.include? group
           group.name
         end
       end.compact.join(", ")

       "You invited #{user.first_name} to join #{final}!" if !final.empty?
  end

  def validate_zipcode
    /\A\d{5}(-\d{4})?\z/.match(self.zipcode)
  end

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
      if user.email
        UserMailer.welcome_email(user).deliver if !user.check_for_instrument_and_zipcode
       end
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
      Request.where(group_id: id, user_id: user.id, finalized: nil, group_approved: nil)[0]
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

  def musician_intelligent_match
    user_array = User.near(self, 20, :order => "distance").where(available: 'seeking a group').collect do |user|
      self.groups.collect do |group|
        if group.instrumentation.instruments.include?(user.instrument)
          if user.instrumentations.include?(group.instrumentation)
            user
          end
        end
      end
    end
    user_array.flatten.compact.uniq.delete_if{|e| e == self}
  end

  def self.return_admins
    self.all.select{|user|!user.admin_of.empty?}
  end

  def admins_close_by
    self.class.return_admins.near(self, order: "distance")
  end

  def city_state
    result = Geocoder.search(zipcode)
    "#{result[0].city}, #{result[0].state_code}"
  end

  private
  def destroy_admin_of
    if admin_of
      admin_of.destroy_all
    end
  end

end
