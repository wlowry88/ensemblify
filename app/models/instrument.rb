class Instrument < ActiveRecord::Base
  has_many :instrument_instrumentations
  has_many :instrumentations, through: :instrument_instrumentations
  has_many :users
end
