class UsersController < ApplicationController

  before_action :authenticate_user!,

  def show
    @plants = current_user.plants
    @user = User.find(params[:id])
  end

end