class ChoresController < ApplicationController
  def new; end

  def show
    chore_id = params[:id].to_i
    @chore = current_user.incomplete_chores.select { |chore| chore.id == chore_id }.pop
    @location = if @chore.outdoor == true
                  'Outdoor'
                else
                  'Indoor'
                end
  end
end
# GET /api/v1/household/:id
