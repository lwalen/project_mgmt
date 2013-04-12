class Task < ActiveRecord::Base
  attr_accessible :content, :due_date, :user_id
end
