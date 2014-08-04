class Instrumentation < ActiveRecord::Base
	has_many :groups
	has_many :interests
	has_many :pieces
end
