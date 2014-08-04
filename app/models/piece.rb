class Piece < ActiveRecord::Base
  belongs_to :type
  has_many :group_pieces
  has_many :groups, through: :group_pieces
end
