class User < ActiveRecord::Base
	has_many :requests
	has_many :groups, through: :requests
	has_many :interests
	has_many :instrumentations, through: :interests
end
