class CreateTableListsTasks < ActiveRecord::Migration
  def change
		create_table :lists_tasks, :id => false do |t|
			t.references :list, :task
		end

		add_index :lists_tasks, [:list_id, :task_id]
  end
end
