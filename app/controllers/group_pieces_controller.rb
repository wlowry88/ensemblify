class GroupPiecesController < ApplicationController
  def create
  	@group_piece = GroupPiece.new(group_piece_params)
  	@group_piece.save

  	render json: {}
  end


  private

  def group_piece_params
  	params.require(:group_piece).permit(:group_id, :piece_id)
  end
end
