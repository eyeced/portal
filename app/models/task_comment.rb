class TaskComment < ActiveRecord::Base
  belongs_to :task
  belongs_to :added_by, class_name: User, foreign_key: "added_by_id"
end
