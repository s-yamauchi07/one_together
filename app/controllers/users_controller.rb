class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # bindiexitng.pry
    @favorite_spot = @user.favorites
    @gone_spot = @user.gone_places
  end
end
