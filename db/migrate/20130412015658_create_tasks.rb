class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.date :due_date, default: nil
      t.integer :user_id, default: nil

      t.timestamps
    end
  end
end
