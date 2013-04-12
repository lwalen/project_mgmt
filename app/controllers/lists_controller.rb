class ListsController < ApplicationController

	def new
		@tasks = Task.all.collect { |t| [t.content[0..20], t.id] }
		@list = List.new
		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

	def create
		@list = List.new
		@list.name = params[:list]['name']
		params[:list][:tasks].each do |task_id|
			if !task_id.empty?
				@list.tasks << Task.find(task_id)
			end
		end

		respond_to do |format|
			if @list.save
				message 'success', "List successfully created."
				format.html { redirect_to lists_path }
				format.json { render json: @list, status: :created, location: @list }
			else
				@tasks = Task.all.collect { |t| [t.content[0..20], t.id] }
				format.html { render action: "new" }
				format.json { render json: @list.errors, status: :unprocessable_entity }
			end
		end
		
	end

	def index
		@lists = List.all
		respond_to do |format|
			format.html
			format.json { render json: @lists }
		end
	end

	def show
		@list = List.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @list }
		end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		message 'success', "List deleted successfully."
		redirect_to lists_path
	end
end
