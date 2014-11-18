class AddAddedByToTaskComments < ActiveRecord::Migration
  def change
    add_column :task_comments, :added_by_id, :integer
  end
end
