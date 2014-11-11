json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :user_id, :comment
  json.url task_url(task, format: :json)
end
