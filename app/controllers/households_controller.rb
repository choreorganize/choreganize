class HouseholdsController < ApplicationController
  # def index
  #   # redirect_to "/households/#{current_user.household_id}"
  # end

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

    household = HouseholdsFacade.create_household(household_info)
    flash[:success] = 'House Created!'

    household_id = {
                    roommate: 
                    {
                    household_id: household.id 
                    }
                    }

    GoogleUserFacade.update_user(household_id)
    redirect_to household_path(id: household.id)
  end
  
  def show
    @user = current_user
    @household = HouseholdsFacade.get_houshold_by_id(params[:id])

    # if current_user.household_id == params[:id].to_i
      # @household = HouseholdsFacade.get_houshold_by_id(params[:id])
    # else
    #   redirect_to user_dashboard_index_url
    # end
  end



end
