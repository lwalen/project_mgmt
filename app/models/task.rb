class Task < ActiveRecord::Base
  attr_accessible :content, :due_date, :user_id, :complete

	belongs_to :user

	scope :incomplete, where(:complete => false)
	default_scope order('due_date IS NULL, due_date ASC')

	validates :content, presence: true

	def date
		due_date ? due_date.strftime('%b %-d') : nil
	end

	def complete?
		complete
	end
end
