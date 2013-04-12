class RemoveColumnListId < ActiveRecord::Migration
  def change
		remove_column :tasks, :list_id

		create_table :lists_tasks do |t|
			t.references :list, :task
		end

		add_index :lists_tasks, [:list_id, :task_id]
  end
end
