class TaskService

  def self.create_task(task_name, user, task_list)
    new.post_api("/tasks/v1/lists/#{task_list}/tasks", task_name, task_list, user)
  end

  def self.get_list(user)
    new.request_api("/tasks/v1/users/@me/lists", user)
  end

  def request_api(path, user)
    resp = connect("https://tasks.googleapis.com", user).get(path)
    parse_json(resp)
  end 

  def post_api(path, task_name, task_list, user)
    resp = Faraday.post("https://tasks.googleapis.com/tasks/v1/lists/#{task_list}/tasks") do |faraday|
      faraday.headers['Authorization'] = "Bearer #{user.token}"
      faraday.headers['Content-Type'] = "application/json"
      faraday.body = { "title": task_name }.to_json 
    end

    parse_json(resp)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true) 
  end

  def connect(url, user)
    Faraday.new(url) do |faraday|
      require 'pry'; binding.pry
      faraday.headers['Authorization'] = "Bearer #{user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end
end