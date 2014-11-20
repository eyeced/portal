class AddStatusToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :string, default: 'assigned'
  end
end
