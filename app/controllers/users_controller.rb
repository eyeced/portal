class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :delete]

  respond_to :html

  def show
  end

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.username
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def delete
    @user.destroy
    repond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :role)
    end
end
