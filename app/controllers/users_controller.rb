class UsersController < ApplicationController
	def index
	end

	def invite
		respond_to do |format|
			user = User.find(params[:id])
			user.invites -= 1
			user.save
			format.html # new.html.erb
			format.json { render json: user }
		end
	end
end
