class GoogleUser
  attr_reader :id,
              :google_id,
              :name,
              :email,
              :household_id,
              :token

  def initialize(attributes)
    @id = attributes[:id]
    @google_id = attributes[:attributes][:google_id]
    @name = attributes[:attributes][:name]
    @email = attributes[:attributes][:email]
    @household_id = attributes[:attributes][:household_id]
    @token = attributes[:attributes][:token]
  end
end
