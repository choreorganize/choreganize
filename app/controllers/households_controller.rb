class HouseholdsController < ApplicationController
  def new; end

  def create
    household_info = {
      household:
      {
        address: params[:address],
        city: params[:city],
        state: params[:state],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    }

    HouseholdsFacade.create_household(household_info)
    flash[:success] = 'House Created!'
    # redirect_to user_dashboard_path
  end
end
