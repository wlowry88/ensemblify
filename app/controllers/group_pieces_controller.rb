class GroupPiecesController < ApplicationController
  def create
  	@group_piece = GroupPiece.new(group_piece_params)
  	if @group_piece.save
			render json: {}
		else
			respond_to do |f|
				f.json { render json: @group_piece.errors.full_messages[0], :status => :unprocessable_entity }
			end
		end
  end

  def destroy
    @group_piece = GroupPiece.find(params[:id])
    @group_piece.destroy

    render json: {}
  end


  private

  def group_piece_params
  	params.require(:group_piece).permit(:group_id, :piece_id)
  end
end
