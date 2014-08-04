class RequestsController < ApplicationController

	def create
		raise request_params.inspect
		@request = Request.new(request_params)
		if @request.save
			redirect_to Group.find(@request.group_id)
		end
		

	end


	private
		def request_params
			params.require(:request).permit(:user_approved, :group_approved, :user_id, :group_id, :finalized, :part)
		end
end
