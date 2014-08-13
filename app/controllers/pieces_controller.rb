class PiecesController < ApplicationController

	def index
		@pieces = Piece.all
	end

	def create
		id = params.first.first.split("||").first
		url = params.first.first.split("||").last
		@piece = Piece.find(id)
		@piece.update_attributes(spotify_id: url)
		render json: {}
	end

	def edit
	end

	def show
	end
	def update

	end
end
