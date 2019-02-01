class UsersController < ApplicationController

  before_action :authenticate_user!,

  def show
    @plants = current_user.plants
  end

end