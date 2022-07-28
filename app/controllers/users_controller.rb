class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_spot = @user.favorites
    @gone_spot = @user.gone_places
  end

  def withdrawal
    @user = User.find(params[:id])
    if @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
    else
      render :unsubscribe
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end
end
