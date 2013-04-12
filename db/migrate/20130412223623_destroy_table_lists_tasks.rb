class DestroyTableListsTasks < ActiveRecord::Migration
  def change
		drop_table :lists_tasks
  end
end
