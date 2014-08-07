class Group < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  belongs_to :instrumentation
  has_many :requests
  has_many :users, through: :requests
  has_many :group_pieces
  has_many :pieces, through: :group_pieces
  belongs_to :admin, class_name: "User"
  has_many :instruments, through: :instrumentation
  geocoded_by :zipcode
  after_validation :geocode


  def members
  	requests.where(finalized: true).collect {|request| User.find(request.user_id)}
  end

  def member_ids
  	requests.where(finalized: true).collect {|request| request.user_id}
  end


end
