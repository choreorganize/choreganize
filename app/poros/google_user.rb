class GoogleUser
  attr_reader :google_id,
              :name,
              :email,
              :household_id,
              :token

  def initialize(attributes)
    @google_id = attributes[:google_id]
    @name = attributes[:name]
    @email = attributes[:email]
    @household_id = attributes[:household_id]
    @token = attributes[:token]
  end
end
