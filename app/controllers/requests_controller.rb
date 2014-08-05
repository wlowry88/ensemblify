class RequestsController < ApplicationController

	def create
		@request = Request.new(request_params)
		if @request.save
			redirect_to Group.find(@request.group_id)
		end
	end	

	def update
		@request = Request.find(params[:id])
		if @request.update(request_params)
			@request.finalize
			redirect_to Group.find(@request.group_id)
		end
	end


	private
		def request_params
			params.require(:request).permit(:user_approved, :group_approved, :user_id, :group_id, :finalized, :part)
		end
end
