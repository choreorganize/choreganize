class AssignmentsService

  def self.connection
    Faraday.new('https://choreganize-api.herokuapp.com/')
  end

  def self.create_assignment(assignment_info)
    response = connection.post('/api/v1/assignments', assignment_info)
    JSON.parse(response.body, symbolize_names: true)
  end
end