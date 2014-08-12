class GroupPiece < ActiveRecord::Base
  belongs_to :group
  belongs_to :piece
  validates_uniqueness_of :piece_id, :scope => :group_id, message: "has already been added to this group :)"
end
