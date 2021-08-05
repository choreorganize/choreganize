class GoogleUser
  attr_reader :id,
              :google_id,
              :name,
              :email,
              :household_id,
              :token,
              :incomplete_chores,
              :completed_chores

  def initialize(user_info)
    @id = user_info[:data][:id]
    @google_id = user_info[:data][:attributes][:google_id]
    @name = user_info[:data][:attributes][:name]
    @email = user_info[:data][:attributes][:email]
    @household_id = user_info[:data][:attributes][:household]
    @token = user_info[:data][:attributes][:token]
    @incomplete_chores = user_info[:data][:attributes][:incomplete_chores]
    @completed_chores = user_info[:data][:attributes][:completed_chores]
  end
end
