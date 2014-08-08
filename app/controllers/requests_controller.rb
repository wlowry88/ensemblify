class RequestsController < ApplicationController

	def create
		@request = Request.new(request_params)
		if @request.save
			if @request.group_approved.nil?
				UserMailer.request_notification(@request.group.admin, @request.user, @request.group).deliver
			elsif @request.user_approved.nil?
				UserMailer.invite_notification(@request.user, @request.group).deliver
			end
			redirect_to Group.find(@request.group_id)
		end
	end

	def update
		@request = Request.find(params[:id])
		if @request.group_approved == nil
			#request
			if @request.update(request_params)
				@request.finalize
				if @request.finalize == true
					UserMailer.accept_request(@request.user, @request.group).deliver
				end
			end

		elsif @request.user_approved == nil
			#invite
			if @request.update(request_params)
				@request.finalize
				if @request.finalize == true
					UserMailer.accept_invite(@request.group.admin, @request.user, @request.group).deliver
				end
			end

		elsif @request.finalized
			@request.update(request_params)

		end
		redirect_to Group.find(@request.group_id)
	end


	private
		def request_params
			params.require(:request).permit(:user_approved, :group_approved, :user_id, :group_id, :finalized, :part)
		end
end
