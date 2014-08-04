class GroupPiece < ActiveRecord::Base
  belongs_to :group
  belongs_to :piece
end
