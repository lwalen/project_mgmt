class List < ActiveRecord::Base
  attr_accessible :name, :tasks

	validates :name, presence: true

	has_and_belongs_to_many :tasks
	validate :has_tasks?

	def has_tasks?
		  self.errors.add :base, "List must have at least one task." if self.tasks.blank?
	end
end
