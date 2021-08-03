require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "GET /user_show" do
    it "returns http success" do
      get "/dashboard"
      
      expect(response).to have_http_status(:success)
    end
  end

end
