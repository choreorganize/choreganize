require 'rails_helper'

RSpec.describe TaskService do
  describe '::create_task' do
    #unauthenticated
    xit 'can connect to the Google Task API', :vcr do
      user_params = { roommate: {
        name: 'Suzie Kim',
        email: 'suziekim.dev@gmail.com',
        google_id: '101278412815195230082',
        token: 'ya29.a0ARrdaM87L11UbxZMDp7_7sz5T63TYlHzdTfpPSHKeLMleubO7Iy-JRA_LuHEdT0YK0xHUz0VW5Z3rAJs6Xhb-W1jl-1EKpe55_gMXwB09vtrWw_v0DzL23MbltPzpA22Kyip0wiDqUqp7nIVzqbb9gBJm7tN'
        } }

      current_user = GoogleUserFacade.user(user_params)

      task_list = 'MTExNDA1MzYzNDIwODcxMDI4NjU6MDow'
      response = TaskService.create_task("Mow the lawn", current_user, task_list)

      expect(response).to be_a(Hash)
    end

    xit 'cannot connect to the Google Task API', :vcr do
      user_params = { roommate: {
        name: 'Suzie Kim',
        email: 'suziekim.dev@gmail.com',
        google_id: '101278412815195230082',
        token: 'ya29.a0ARrdaM8He2f1lV96cw6s83YS2Ikxtl1g0av-enxXPPK1iEgiy9QtYIgZ6J2DKmHe6VaLlaxgLQX3Tdu8D9Zv52R8eQTnZQG8m1wQ5m_338_6qA9Cbpv9gnAAD1yEPSrj1bcL1O41vCajVE42TsSDC0PS2N7I'
        } }

      current_user = GoogleUserFacade.user(user_params)

      task_list = 'MTExNDA1MzYzNDIwODcxMDI4NjU6MDow'
      response = TaskService.create_task("Mow the lawn", current_user, task_list)

      expect(response).to be_a(Hash)
      expect(response[:error]).to have_key(:code)
      expect(response[:error]).to have_key(:message)
      expect(response[:error]).to have_key(:errors)
      expect(response[:error]).to have_key(:status)
      expect(response[:error][:code]).to eq(401)
      expect(response[:error][:message]).to eq("Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.")
    end
  end
end
