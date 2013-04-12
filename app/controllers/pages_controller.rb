class PagesController < ApplicationController

	def index
		@today = Date.today

		@upcoming_tasks = []

		if current_user
			current_user.tasks.each do |task|
				if task.due_date != nil && !task.complete? && (task.due_date - @today).to_i < 3
					@upcoming_tasks << task
				end
			end
		end

	end

	def authorize
		respond_to do |format|
			format.html # authorize.html.erb
		end
	end
end
