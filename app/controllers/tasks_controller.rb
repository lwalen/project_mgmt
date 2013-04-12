class TasksController < ApplicationController

	def index
		if current_user != nil
			@tasks = Task.all
			@task = Task.new
			@users = User.all.collect { |u| [u.name, u.id] }

			respond_to do |format|
				format.html # index.html.erb
				format.json { render json: @tasks }
			end
		else
			message 'error', 'You must be logged in to view this page'
			redirect_to root_path
		end
	end

	def show
	end

	def create
		@task = Task.new(params[:task])
		#@task.user_id = current_user.id

		respond_to do |format|
			if @task.save
				message 'success', "Task successfully created."
				format.html { redirect_to tasks_path }
				format.json { render json: @task, status: :created, location: @task }
			else
				format.html { render action: "new" }
				format.json { render json: @task.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@task = Task.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @task }
		end
	end

	def edit
		@task = Task.find(params[:id])
		@users = User.all.collect { |u| [u.name, u.id] }
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		message 'success', "Task deleted successfully."
		redirect_to tasks_path
	end

	def update
		@task = Task.find(params[:id])

		respond_to do |format|
			if @task.update_attributes(params[:task])
				message 'success', "Task successfully updated."
				format.html { redirect_to tasks_path }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @task.errors, status: :unprocessable_entity }
			end
		end
	end
end
