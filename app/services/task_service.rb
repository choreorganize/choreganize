class TaskService

  def self.create_task(task_name, user)
    new.post_api("/tasks/v1/users/@me/lists", task_name, user)
  end

  def post_api(path, task_name, user)
    resp = conn("https://tasks.googleapis.com").post(path) do |req|
      # req.header['Authorization'] = "Bearer #{roommate.token}" 
      # just headers getting passed but not really authorized
      # req.headers['Authorization'] = "Bearer #{user[:credentials][:token]}"
      req.body = { 
        title: task_name
      }
    end
    parse_json(resp)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true) 
  end

  def conn(url, user)
    #Faraday.new(url)
    Faraday.new(url) do
      # adding in the authentication step 
      # what have you authorized in postman that you haven't here
      conn.authorization :Bearer, session[:credentials][:token]
    end
  end
end