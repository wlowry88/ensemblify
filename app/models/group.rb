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

  def custom_type=(custom_type)
    self.instrumentation = Instrumentation.create(name: "Custom: #{custom_type}")
  end

  def instrument_ids=(attributes)
    attributes.each do |id|
      if !id.empty?
        self.instrumentation.instruments << Instrument.find(id)
      end
    end
    self.instrumentation.save
  end

  def city_state
    result = Geocoder.search(zipcode)
    if result[0]
      "#{result[0].city}, #{result[0].state_code}"
    else
      "Not given"
    end
  end


end
