class PiecesController < ApplicationController

	def index
		@pieces = Piece.all
	end

	def create
	end
end
