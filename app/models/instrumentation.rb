class Instrumentation < ActiveRecord::Base
	has_many :groups
	has_many :interests
	has_many :pieces
  has_many :instrument_instrumentations
  has_many :instruments, through: :instrument_instrumentations
end
