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
    @id = user_info[:id]
    @google_id = user_info[:google_id]
    @name = user_info[:name]
    @email = user_info[:email]
    @household_id = user_info[:household_id]
    @token = user_info[:token]
    @incomplete_chores = user_info[:incomplete_chores]
    @completed_chores = user_info[:completed_chores]
  end
end
