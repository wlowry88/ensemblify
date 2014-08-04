class Group < ActiveRecord::Base
  belongs_to :instrumentation
  has_many :requests
  has_many :users, through: :requests
  has_many :group_pieces
  has_many :pieces, through: :group_pieces
end
