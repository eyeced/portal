json.array!(@task_comments) do |task_comment|
  json.extract! task_comment, :id, :comment, :task_id
  json.url task_comment_url(task_comment, format: :json)
end
