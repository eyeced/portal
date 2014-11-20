class Task < ActiveRecord::Base
  belongs_to :user
  has_many :task_comments

  STATUS = %w[assigned started completed incompleted]
end
