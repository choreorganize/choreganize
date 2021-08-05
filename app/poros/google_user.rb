class GoogleUser
  attr_reader :id,
              :google_id,
              :name,
              :email,
              :household_id,
              :token,
              :incomplete_chores,
              :completed_chores

  def initialize(attributes)
    # require 'pry'; binding.pry
    @id = attributes[:data][:id]
    @google_id = attributes[:data][:attributes][:google_id]
    @name = attributes[:data][:attributes][:name]
    @email = attributes[:data][:attributes][:email]
    @household_id = attributes[:data][:attributes][:household_id]
    @token = attributes[:data][:attributes][:token]
    @incomplete_chores = attributes[:data][:attributes][:incomplete_chores]
    @completed_chores = attributes[:data][:attributes][:completed_chores]
  end
end


