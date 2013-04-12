class UsersController < ApplicationController
	def index
		@users = User.all

		respond_to do |format|
			format.html
			format.json { render json: @users }
		end
	end

	def show
		@user = User.find(params[:id])
		@tasks = @user.tasks

		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	def invite
		respond_to do |format|
			user = User.find(params[:id])
			user.invites -= 1
			user.save
			format.html
			format.json { render json: user }
		end
	end
end
