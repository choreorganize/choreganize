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
    @id = attributes[:id]
    @google_id = attributes[:google_id]
    @name = attributes[:name]
    @email = attributes[:email]
    @household_id = attributes[:household_id]
    @token = attributes[:token]
    @incomplete_chores = attributes[:incomplete_chores]
    @completed_chores = attributes[:completed_chores]
  end
end
