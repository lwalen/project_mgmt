class AddColumnToUsers < ActiveRecord::Migration
  def change

		add_column :users, :invites, :integer, default: 5
  end
end
